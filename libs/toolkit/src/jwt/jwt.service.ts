import * as dayjs from 'dayjs';
import { Global, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import {
  PrismaService,
  Sha256Service,
  UserModel,
  throwInternalServerError,
  uuid,
} from '@app/toolkit';

import { JwtResponse } from './jwt.responses';

@Global()
@Injectable()
export class JwtService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly sha256: Sha256Service,
    private readonly configs: ConfigService,
  ) {}

  async createNewTokens(clientId: string): Promise<JwtResponse> {
    const refreshToken = uuid();
    const accessToken = uuid();

    const expiresAt = this.getTokenExpiresAt();
    const refreshExpiresAt = this.getRefreshTokenExpiresAt();

    const data = {
      user_id: clientId,
      token: this.sha256.strToSha256(accessToken),
      r_token: this.sha256.strToSha256(refreshToken),
      expires_at: expiresAt,
      r_expires_at: refreshExpiresAt,
      invoked: false,
    };

    try {
      await this.prisma.token.create({ data });
      return {
        token: accessToken,
        r_token: refreshToken,
        expires_at: expiresAt,
      };
    } catch (error) {
      throwInternalServerError();
    }
  }

  async fetchUserByToken(
    inputToken: string,
  ): Promise<{ user: UserModel | null; token: string }> {
    const token = this.sha256.strToSha256(inputToken);
    const user = await this.prisma.user.findFirst({
      where: {
        tokens: {
          some: {
            token,
            expires_at: {
              gte: dayjs().toISOString(),
            },
            invoked: false,
          },
        },
      },
    });

    return { user, token };
  }

  async fetchUserByTokenAndRefreshToken(
    token: string,
    refreshToken: string,
  ): Promise<UserModel | null> {
    return await this.prisma.user.findFirst({
      where: {
        tokens: {
          some: {
            token: this.sha256.strToSha256(token),
            r_token: this.sha256.strToSha256(refreshToken),
            r_expires_at: {
              gte: dayjs().toISOString(),
            },
            invoked: false,
          },
        },
      },
    });
  }

  async revokeToken(token: string, deleteAction = false) {
    if (deleteAction) {
      return await this.prisma.token.delete({
        where: {
          token: token,
        },
      });
    }

    return await this.prisma.token.update({
      where: {
        token: token,
      },
      data: {
        invoked: true,
      },
    });
  }

  getTokenExpiresAt() {
    const ttl = this.configs.get<number>('jwt.tokenTtl');
    return dayjs()
      .add(ttl || 5, 'h')
      .toISOString();
  }

  getRefreshTokenExpiresAt() {
    const ttl = this.configs.get<number>('jwt.rTokenTtl');
    return dayjs()
      .add(ttl || 5, 'h')
      .toISOString();
  }
}

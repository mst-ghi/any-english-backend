import { Injectable } from '@nestjs/common';
import {
  LoginDto,
  RefreshDto,
  ChangePasswordDto,
  RegisterDto,
} from './auth.dto';
import {
  BaseService,
  stringToHash,
  JwtService,
  UserModel,
  UserStatusEnum,
  UserAccessEnum,
} from '@app/toolkit';

@Injectable()
export class AuthService extends BaseService {
  constructor(private readonly jwtService: JwtService) {
    super();
  }

  async login(dto: LoginDto) {
    const user = await this.findUserByEmailAndPassword(dto.email, dto.password);
    return await this.jwtService.createNewTokens(user.id);
  }

  async register(dto: RegisterDto) {
    let user = await this.prisma.user.findFirst({
      where: { email: dto.email },
    });

    if (user) {
      this.unprocessableEntityException(['email'], 'Email already exist');
    }

    try {
      user = await this.prisma.user.create({
        data: {
          ...dto,
          password: stringToHash(dto.password),
          access: UserAccessEnum.User,
          status: UserStatusEnum.Active,
        },
      });

      return {
        user,
        tokens: await this.jwtService.createNewTokens(user.id),
      };
    } catch (error) {
      this.catchError(error, AuthService.name);
    }
  }

  async logout(token: string) {
    await this.jwtService.revokeToken(token, true);
  }

  async changePassword(clientId: string, dto: ChangePasswordDto) {
    const whereCondition = { id: clientId };

    if (dto.current_password) {
      whereCondition['password'] = stringToHash(dto.current_password);
    }

    const client = await this.prisma.user.findFirst({
      where: whereCondition,
    });

    if (!client) {
      if (dto.current_password) {
        this.unprocessableEntityException(['current_password']);
      } else {
        this.notFoundException('User not found!');
      }
    }

    try {
      await this.prisma.user.update({
        where: { id: clientId },
        data: { password: stringToHash(dto.new_password) },
      });
    } catch (error) {
      this.catchError(error, 'AuthService');
    }
  }

  async refreshToken(dto: RefreshDto) {
    const user = await this.jwtService.fetchUserByTokenAndRefreshToken(
      dto.token,
      dto.r_token,
    );

    if (!user) {
      this.badRequestException();
    }

    return await this.jwtService.createNewTokens(user.id);
  }

  async findUserByEmailAndPassword(
    email: string,
    password: string,
  ): Promise<UserModel> {
    const user = await this.prisma.user.findFirst({
      where: {
        email,
        password: stringToHash(password),
      },
    });

    if (!user) {
      this.badRequestException();
    }

    if (user.status !== UserStatusEnum.Active) {
      this.limitedUnAuthorizedException();
    }

    return user;
  }
}

import {
  Injectable,
  CanActivate,
  ExecutionContext,
  applyDecorators,
  UseGuards,
  createParamDecorator,
} from '@nestjs/common';
import { ApiBearerAuth } from '@nestjs/swagger';
import {
  JwtService,
  throwForbidden,
  throwLimitedUnAuthorized,
  throwUnAuthorized,
  UserAccessEnum,
  UserStatusEnum,
} from '@app/toolkit';

@Injectable()
export class AuthTokenGuard implements CanActivate {
  constructor(private readonly jwtService: JwtService) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();

    const incomeToken = this.getTokenFromRequest(request);
    const { user, token } = await this.jwtService.fetchUserByToken(incomeToken);

    if (user) {
      if (user.status !== UserStatusEnum.Active) {
        throwLimitedUnAuthorized();
      }

      delete user.password;
      request.user = user;
      request.userId = user.id;
      request.token = token;
      return true;
    }

    throwUnAuthorized();
  }

  getTokenFromRequest(request: any) {
    let token;

    try {
      token =
        request.headers['authorization'] || request.headers['Authorization'];
      token = token.replace('Bearer ', '').replace('bearer ', '');
    } catch (error) {
      token = undefined;
    }

    if (!token) {
      throwUnAuthorized();
    }

    return token;
  }
}

@Injectable()
export class AuthGuestGuard implements CanActivate {
  constructor(private readonly jwtService: JwtService) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();

    const incomeToken = this.getTokenFromRequest(request);

    if (incomeToken) {
      const { user, token } =
        await this.jwtService.fetchUserByToken(incomeToken);

      if (user) {
        delete user.password;
        request.user = user;
        request.userId = user.id;
        request.token = token;
      }
    }

    return true;
  }

  getTokenFromRequest(request: any) {
    let token;

    try {
      token =
        request.headers['authorization'] || request.headers['Authorization'];
      token = token.replace('Bearer ', '').replace('bearer ', '');
    } catch (error) {
      token = undefined;
    }

    return token;
  }
}

@Injectable()
export class AdminAccessGuard implements CanActivate {
  constructor(private readonly jwtService: JwtService) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();

    if (request.user && request.user.access === UserAccessEnum.Admin) {
      return true;
    }

    throwForbidden();
  }
}

export function AuthGuard() {
  return applyDecorators(UseGuards(AuthTokenGuard), ApiBearerAuth());
}

export function GuestGuard() {
  return applyDecorators(UseGuards(AuthGuestGuard));
}

export function AdminGuard() {
  return applyDecorators(
    UseGuards(AuthTokenGuard),
    UseGuards(AdminAccessGuard),
    ApiBearerAuth(),
  );
}

export const User = createParamDecorator((_, req) => {
  return req.args[0].user;
});

export const UserId = createParamDecorator((_, req) => {
  return req.args[0].userId;
});

export const UserToken = createParamDecorator((_, req) => {
  return req.args[0].token;
});

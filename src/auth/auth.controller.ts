import { Body, Controller } from '@nestjs/common';
import { ApiResponse, ApiTags } from '@nestjs/swagger';

import {
  ApiSignature,
  AuthGuard,
  BaseResponse,
  User,
  UserModel,
  UserToken,
} from '@app/toolkit';

import { AuthService } from './auth.service';
import {
  RefreshDto,
  ChangePasswordDto,
  LoginDto,
  RegisterDto,
} from './auth.dto';
import {
  LoginResponse,
  RegisterResponse,
  UserResponse,
} from './auth.responses';

@ApiTags('auth')
@Controller('auth')
export class AuthController {
  constructor(private readonly service: AuthService) {}

  @ApiSignature({
    method: 'GET',
    path: '/user',
    summary: 'get logged in user info',
  })
  @ApiResponse({ status: 200, type: UserResponse })
  @AuthGuard()
  async User(@User() user: UserModel): Promise<UserResponse> {
    return {
      user,
    };
  }

  @ApiSignature({
    method: 'POST',
    path: '/login',
    summary: 'login api',
  })
  @ApiResponse({ status: 200, type: LoginResponse })
  async login(@Body() dto: LoginDto): Promise<LoginResponse> {
    return {
      tokens: await this.service.login(dto),
    };
  }

  @ApiSignature({
    method: 'POST',
    path: '/register',
    summary: 'register api',
  })
  @ApiResponse({ status: 200, type: RegisterResponse })
  async register(@Body() dto: RegisterDto): Promise<RegisterResponse> {
    return await this.service.register(dto);
  }

  @ApiSignature({
    method: 'POST',
    path: '/refresh',
    summary: 'get new tokens by refresh token',
  })
  @ApiResponse({ status: 200, type: LoginResponse })
  async UserRefreshToken(@Body() dto: RefreshDto): Promise<LoginResponse> {
    return {
      tokens: await this.service.refreshToken(dto),
    };
  }

  @ApiSignature({
    method: 'POST',
    path: '/change-password',
    summary: 'change user password',
  })
  @ApiResponse({ status: 200, type: BaseResponse })
  @AuthGuard()
  async UserChangePassword(
    @Body() dto: ChangePasswordDto,
    @User() User: UserModel,
  ) {
    await this.service.changePassword(User.id, dto);
  }

  @ApiSignature({
    method: 'GET',
    path: '/logout',
    summary: 'logout user',
  })
  @ApiResponse({ status: 200, type: BaseResponse })
  @AuthGuard()
  async UserLogout(@UserToken() token: string) {
    await this.service.logout(token);
  }
}

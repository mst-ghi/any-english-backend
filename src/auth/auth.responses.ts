import { BaseResponse, UserModel } from '@app/toolkit';
import { ApiProperty } from '@nestjs/swagger';

export class TokenResponse {
  @ApiProperty()
  token: string;

  @ApiProperty()
  r_token: string;

  @ApiProperty()
  expires_at: string;
}

export class LoginResponse extends BaseResponse {
  @ApiProperty({ type: TokenResponse })
  tokens: TokenResponse;
}

export class RegisterResponse extends BaseResponse {
  @ApiProperty({ type: UserModel })
  user: any;

  @ApiProperty({ type: TokenResponse })
  tokens: TokenResponse;
}

export class UserResponse extends BaseResponse {
  @ApiProperty({ type: UserModel })
  user: any;
}

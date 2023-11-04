import { ApiProperty } from '@nestjs/swagger';

export class TokenModel {
  @ApiProperty()
  id: string;

  @ApiProperty()
  user_id: string;

  @ApiProperty()
  token: string;

  @ApiProperty()
  r_token: string;

  @ApiProperty()
  invoked: boolean;

  @ApiProperty()
  expires_at?: Date;

  @ApiProperty()
  r_expires_at?: Date;

  @ApiProperty()
  created_at?: Date;
}

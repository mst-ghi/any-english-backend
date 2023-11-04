import { ApiProperty } from '@nestjs/swagger';

export class JwtResponse {
  @ApiProperty()
  token: string;

  @ApiProperty()
  r_token: string;

  @ApiProperty()
  expires_at: string;
}

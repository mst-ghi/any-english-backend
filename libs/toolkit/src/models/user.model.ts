import { ApiProperty } from '@nestjs/swagger';
import { UserAccessEnum, UserStatusEnum } from '../enums';
import { Exclude } from 'class-transformer';

export class UserModel {
  @ApiProperty()
  id: string;

  @ApiProperty()
  email: string;

  @ApiProperty()
  fullname: string;

  @Exclude()
  password: string;

  @ApiProperty({ enum: UserAccessEnum })
  access: string;

  @ApiProperty({ enum: UserStatusEnum })
  status: string;

  @ApiProperty()
  created_at?: Date;
}

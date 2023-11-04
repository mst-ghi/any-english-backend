import { ApiProperty } from '@nestjs/swagger';
import {
  IsEmail,
  IsNotEmpty,
  IsString,
  Length,
  MaxLength,
  MinLength,
} from 'class-validator';

export class LoginDto {
  @IsEmail()
  @IsNotEmpty()
  @ApiProperty()
  email: string;

  @Length(8, 191)
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  password: string;
}

export class RegisterDto {
  @IsEmail()
  @IsNotEmpty()
  @ApiProperty()
  email: string;

  @Length(2, 191)
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  fullname: string;

  @Length(8, 191)
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  password: string;
}

export class RefreshDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  token: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  r_token: string;
}

export class ChangePasswordDto {
  @MinLength(8)
  @MaxLength(191)
  @IsString()
  @ApiProperty()
  current_password: string;

  @MinLength(8)
  @MaxLength(191)
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  new_password: string;
}

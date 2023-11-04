import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';

export class CreateWordDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  word: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  meaning: string;
}

export class UpdateWordDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  word: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  meaning: string;
}

import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';

export class CreatePhraseDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  word_id: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  phrase: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  meaning: string;
}

export class UpdatePhraseDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  phrase: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  meaning: string;
}

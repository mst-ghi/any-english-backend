import { LightnerLevelEnum } from '@app/toolkit';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsNumber, IsString } from 'class-validator';

export class LightnerWordDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  word_id: string;

  @IsNumber()
  @IsNotEmpty()
  @ApiProperty({
    enum: LightnerLevelEnum,
    description: '0 value for delete action',
  })
  level: number;
}

export class LightnerPhraseDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  phrase_id: string;

  @IsNumber()
  @IsNotEmpty()
  @ApiProperty({
    enum: LightnerLevelEnum,
    description: '0 value for delete action',
  })
  level: number;
}

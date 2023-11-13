import { ApiProperty } from '@nestjs/swagger';
import { ArrayMinSize, IsArray, IsNotEmpty, IsString } from 'class-validator';

export class CreateConversationDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  title: string;

  @IsString({ each: true })
  @ArrayMinSize(2)
  @IsArray()
  @IsNotEmpty()
  @ApiProperty()
  characters: string[];
}

export class UpdateConversationDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  title: string;

  @IsString({ each: true })
  @ArrayMinSize(2)
  @IsArray()
  @IsNotEmpty()
  @ApiProperty()
  characters: string[];
}

export class CreateConversationItemDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  conversation_id: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  character: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  phrase: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  meaning: string;
}

export class UpdateConversationItemDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  character: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  phrase: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  meaning: string;
}

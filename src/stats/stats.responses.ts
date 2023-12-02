import { BaseResponse, WordModel } from '@app/toolkit';
import { ApiProperty } from '@nestjs/swagger';

export class LastWordResponse extends BaseResponse {
  @ApiProperty({ type: () => WordModel })
  word: any;
}

export class StatsCountResponse extends BaseResponse {
  @ApiProperty()
  words: number;

  @ApiProperty()
  phrases: number;

  @ApiProperty()
  conversations: number;
}

export class WordsCountResponse extends BaseResponse {
  @ApiProperty()
  count: number;
}

export class PhrasesCountResponse extends BaseResponse {
  @ApiProperty()
  count: number;
}

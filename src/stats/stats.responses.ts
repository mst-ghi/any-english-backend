import { BaseResponse, WordModel } from '@app/toolkit';
import { ApiProperty } from '@nestjs/swagger';

export class LastWordResponse extends BaseResponse {
  @ApiProperty({ type: () => WordModel })
  word: any;
}

export class WordsCountResponse extends BaseResponse {
  @ApiProperty()
  count: number;
}

export class PhrasesCountResponse extends BaseResponse {
  @ApiProperty()
  count: number;
}

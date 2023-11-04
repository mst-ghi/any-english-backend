import { BaseResponse, PaginationMetaResponse, WordModel } from '@app/toolkit';
import { ApiProperty } from '@nestjs/swagger';

export class WordsResponse extends BaseResponse {
  @ApiProperty({ type: () => [WordModel] })
  words: any;

  @ApiProperty({ type: PaginationMetaResponse })
  meta: any;
}

export class WordResponse extends BaseResponse {
  @ApiProperty({ type: () => WordModel })
  word: any;
}

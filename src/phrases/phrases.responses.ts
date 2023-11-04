import { ApiProperty } from '@nestjs/swagger';
import {
  BaseResponse,
  PaginationMetaResponse,
  PhraseModel,
} from '@app/toolkit';

export class PhrasesResponse extends BaseResponse {
  @ApiProperty({ type: () => [PhraseModel] })
  phrases: any;

  @ApiProperty({ type: PaginationMetaResponse })
  meta: any;
}

export class PhraseResponse extends BaseResponse {
  @ApiProperty({ type: () => PhraseModel })
  phrase: any;
}

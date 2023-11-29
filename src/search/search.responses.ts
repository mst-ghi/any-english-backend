import {
  BaseResponse,
  ConversationModel,
  PhraseModel,
  WordModel,
} from '@app/toolkit';
import { ApiProperty } from '@nestjs/swagger';

export class SearchResponse extends BaseResponse {
  @ApiProperty({ type: () => [WordModel] })
  words: any;

  @ApiProperty({ type: () => [PhraseModel] })
  phrases: any;

  @ApiProperty({ type: () => [ConversationModel] })
  conversations: any;
}

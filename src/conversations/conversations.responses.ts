import { ApiProperty } from '@nestjs/swagger';
import {
  BaseResponse,
  PaginationMetaResponse,
  ConversationModel,
  ConversationFullModel,
  ConversationItemModel,
} from '@app/toolkit';

export class ConversationsResponse extends BaseResponse {
  @ApiProperty({ type: () => [ConversationModel] })
  conversations: any;

  @ApiProperty({ type: PaginationMetaResponse })
  meta: any;
}

export class ConversationResponse extends BaseResponse {
  @ApiProperty({ type: () => ConversationFullModel })
  conversation: any;
}

export class ConversationItemResponse extends BaseResponse {
  @ApiProperty({ type: () => ConversationItemModel })
  item: any;
}

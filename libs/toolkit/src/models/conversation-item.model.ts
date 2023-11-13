import { ApiProperty } from '@nestjs/swagger';

export class ConversationItemModel {
  @ApiProperty()
  id: string;

  @ApiProperty()
  conversation_id: string;

  @ApiProperty()
  character: string;

  @ApiProperty()
  phrase: string;

  @ApiProperty()
  meaning: string | null;

  @ApiProperty()
  created_at?: Date;
}

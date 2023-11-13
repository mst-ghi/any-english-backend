import { ApiProperty } from '@nestjs/swagger';
import { ConversationItemModel } from './conversation-item.model';

export class ConversationModel {
  @ApiProperty()
  id: string;

  @ApiProperty()
  title: string;

  @ApiProperty()
  characters: string[];

  @ApiProperty()
  created_at?: Date;
}

export class ConversationFullModel {
  @ApiProperty()
  id: string;

  @ApiProperty()
  title: string;

  @ApiProperty()
  characters: string[];

  @ApiProperty()
  created_at?: Date;

  @ApiProperty({ type: () => [ConversationItemModel] })
  items?: any[];
}

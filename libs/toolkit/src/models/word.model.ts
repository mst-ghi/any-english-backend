import { ApiProperty } from '@nestjs/swagger';
import { PhraseModel } from './phrase.model';

export class WordModel {
  @ApiProperty()
  id: string;

  @ApiProperty()
  word: string;

  @ApiProperty()
  meaning: string | null;

  @ApiProperty()
  created_at?: Date;

  @ApiProperty({ type: () => [PhraseModel], required: false })
  phrases?: any[];
}

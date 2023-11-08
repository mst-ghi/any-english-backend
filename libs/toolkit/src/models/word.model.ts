import { ApiProperty } from '@nestjs/swagger';
import { PhraseModel } from './phrase.model';
import { LightnerShortModel } from './lightner.model';

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

  @ApiProperty({ type: () => [LightnerShortModel], required: false })
  lightners?: any;
}

export class WordShortModel {
  @ApiProperty()
  id: string;

  @ApiProperty()
  word: string;

  @ApiProperty()
  meaning: string | null;
}

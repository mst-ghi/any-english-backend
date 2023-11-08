import { ApiProperty } from '@nestjs/swagger';
import { WordShortModel } from './word.model';
import { PhraseShortModel } from './phrase.model';

export class LightnerModel {
  @ApiProperty()
  id: string;

  @ApiProperty()
  user_id: string;

  @ApiProperty()
  word_id: string | null;

  @ApiProperty()
  phrase_id: string | null;

  @ApiProperty()
  level: number;

  @ApiProperty()
  created_at?: Date;

  @ApiProperty({ type: () => WordShortModel, required: false })
  word?: any;

  @ApiProperty({ type: () => PhraseShortModel, required: false })
  phrase?: any;
}

export class LightnerShortModel {
  @ApiProperty()
  id: string;

  @ApiProperty()
  user_id: string;

  @ApiProperty()
  word_id: string | null;

  @ApiProperty()
  phrase_id: string | null;

  @ApiProperty()
  level: number;
}

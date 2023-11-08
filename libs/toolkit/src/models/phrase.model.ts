import { ApiProperty } from '@nestjs/swagger';

export class PhraseModel {
  @ApiProperty()
  id: string;

  @ApiProperty()
  word_id: string;

  @ApiProperty()
  phrase: string;

  @ApiProperty()
  meaning: string | null;

  @ApiProperty()
  created_at?: Date;
}

export class PhraseShortModel {
  @ApiProperty()
  id: string;

  @ApiProperty()
  phrase: string;

  @ApiProperty()
  meaning: string | null;
}

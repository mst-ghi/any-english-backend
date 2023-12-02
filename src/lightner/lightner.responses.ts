import { ApiProperty } from '@nestjs/swagger';
import { BaseResponse, LightnerModel } from '@app/toolkit';

export class LightnersResponse extends BaseResponse {
  @ApiProperty({ type: () => [LightnerModel] })
  lightners: any;
}

export class LightnerResponse extends BaseResponse {
  @ApiProperty({ type: () => LightnerModel })
  lightner: any;
}

export class LightnerCountsResponse extends BaseResponse {
  @ApiProperty()
  word_id: number;

  @ApiProperty()
  phrase_id: number;
}

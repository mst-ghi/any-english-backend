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

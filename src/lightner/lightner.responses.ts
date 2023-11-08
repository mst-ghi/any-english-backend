import { ApiProperty } from '@nestjs/swagger';
import {
  BaseResponse,
  LightnerModel,
  PaginationMetaResponse,
} from '@app/toolkit';

export class LightnersResponse extends BaseResponse {
  @ApiProperty({ type: () => [LightnerModel] })
  lightners: any;

  @ApiProperty({ type: PaginationMetaResponse })
  meta: any;
}

export class LightnerResponse extends BaseResponse {
  @ApiProperty({ type: () => LightnerModel })
  lightner: any;
}

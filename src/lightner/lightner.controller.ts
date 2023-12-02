import { Body, Controller, Query } from '@nestjs/common';
import { ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import { LightnerService } from './lightner.service';
import { LightnersResponse } from './lightner.responses';
import { LightnerPhraseDto, LightnerWordDto } from './lightner.dto';

import {
  ApiSignature,
  AuthGuard,
  BaseResponse,
  LightnerTypeEnum,
  UserId,
} from '@app/toolkit';

@ApiTags('lightner')
@Controller('lightner')
export class LightnerController {
  constructor(private readonly service: LightnerService) {}

  @ApiSignature({
    method: 'GET',
    path: '/',
    summary: 'lightner list data',
  })
  @ApiQuery({
    name: 'type',
    description: 'type of lightner',
    required: false,
    enum: LightnerTypeEnum,
  })
  @ApiResponse({ status: 200, type: LightnersResponse })
  @AuthGuard()
  async list(
    @UserId() userId: string,
    @Query('type') type: LightnerTypeEnum,
  ): Promise<LightnersResponse> {
    return {
      lightners: await this.service.list({
        userId,
        type:
          type &&
          [LightnerTypeEnum.Phrase, LightnerTypeEnum.Word].includes(type)
            ? type
            : undefined,
      }),
    };
  }

  @ApiSignature({
    method: 'PUT',
    path: '/word',
    summary: 'upsert lightner word',
  })
  @ApiResponse({ status: 200, type: BaseResponse })
  @AuthGuard()
  async upsertWord(@UserId() userId: string, @Body() dto: LightnerWordDto) {
    await this.service.upsertWord(userId, dto);
  }

  @ApiSignature({
    method: 'PUT',
    path: '/phrase',
    summary: 'upsert lightner phrase',
  })
  @ApiResponse({ status: 200, type: BaseResponse })
  @AuthGuard()
  async upsertPhrase(@UserId() userId: string, @Body() dto: LightnerPhraseDto) {
    await this.service.upsertPhrase(userId, dto);
  }
}

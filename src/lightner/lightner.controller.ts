import { Body, Controller, Logger, Query } from '@nestjs/common';
import { ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import { LightnerService } from './lightner.service';
import { LightnersResponse } from './lightner.responses';
import { LightnerPhraseDto, LightnerWordDto } from './lightner.dto';

import {
  ApiSignature,
  AuthGuard,
  BaseResponse,
  LightnerLevelEnum,
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
    summary: 'word list',
    isPagination: true,
  })
  @ApiQuery({
    name: 'level',
    description: 'level of lightner',
    required: false,
    enum: LightnerLevelEnum,
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
    @Query('page') page: string,
    @Query('take') take: string,
    @Query('level') level: string,
    @Query('type') type: LightnerTypeEnum,
  ): Promise<LightnersResponse> {
    let levelTrueValue: number;

    if (level) {
      try {
        levelTrueValue = Number(level);
      } catch (error) {
        Logger.error('level query is invalid: ' + level, 'LightnerController');
      }
    }

    const { data, meta } = await this.service.list({
      userId,
      page,
      take,
      type:
        type && [LightnerTypeEnum.Phrase, LightnerTypeEnum.Word].includes(type)
          ? type
          : undefined,
      level: levelTrueValue,
    });

    return {
      lightners: data,
      meta,
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

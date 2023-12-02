import { Controller } from '@nestjs/common';
import { StatsService } from './stats.service';
import { ApiSignature } from '@app/toolkit';
import { ApiResponse, ApiTags } from '@nestjs/swagger';
import {
  LastWordResponse,
  PhrasesCountResponse,
  StatsCountResponse,
  WordsCountResponse,
} from './stats.responses';

@ApiTags('stats')
@Controller('stats')
export class StatsController {
  constructor(private readonly service: StatsService) {}

  @ApiSignature({
    method: 'GET',
    path: '/',
    summary: 'get all stats',
  })
  @ApiResponse({ status: 200, type: StatsCountResponse })
  async all(): Promise<StatsCountResponse> {
    return await this.service.allStats();
  }

  @ApiSignature({
    method: 'GET',
    path: '/last/word',
    summary: 'get last word',
  })
  @ApiResponse({ status: 200, type: LastWordResponse })
  async lastWord(): Promise<LastWordResponse> {
    return {
      word: await this.service.lastWord(),
    };
  }

  @ApiSignature({
    method: 'GET',
    path: '/words/count',
    summary: 'words count',
  })
  @ApiResponse({ status: 200, type: WordsCountResponse })
  async wordsCount(): Promise<WordsCountResponse> {
    return {
      count: await this.service.wordsCount(),
    };
  }

  @ApiSignature({
    method: 'GET',
    path: '/phrases/count',
    summary: 'phrases count',
  })
  @ApiResponse({ status: 200, type: PhrasesCountResponse })
  async phrasesCount(): Promise<PhrasesCountResponse> {
    return {
      count: await this.service.phrasesCount(),
    };
  }
}

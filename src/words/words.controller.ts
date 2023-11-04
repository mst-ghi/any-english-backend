import { Body, Controller, Param, Query } from '@nestjs/common';
import { ApiParam, ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import { ApiSignature, AdminGuard } from '@app/toolkit';
import { WordsService } from './words.service';
import { WordResponse, WordsResponse } from './words.responses';
import { CreateWordDto, UpdateWordDto } from './words.dto';

@ApiTags('words')
@Controller('words')
export class WordsController {
  constructor(private readonly service: WordsService) {}

  @ApiSignature({
    method: 'GET',
    path: '/',
    summary: 'word list',
    isPagination: true,
  })
  @ApiQuery({
    name: 'search',
    description: 'searching on word and meaning',
    required: false,
  })
  @ApiResponse({ status: 200, type: WordsResponse })
  async list(
    @Query('page') page: string,
    @Query('take') take: string,
    @Query('search') search: string,
  ): Promise<WordsResponse> {
    const { data, meta } = await this.service.list({ page, take, search });
    return {
      words: data,
      meta,
    };
  }

  @ApiSignature({
    method: 'GET',
    path: '/:id',
    summary: 'word info',
  })
  @ApiParam({ name: 'id', description: 'word id' })
  @ApiResponse({ status: 200, type: WordResponse })
  async getOne(@Param('id') wordId: string): Promise<WordResponse> {
    return {
      word: await this.service.getOne(wordId),
    };
  }

  @ApiSignature({
    method: 'POST',
    path: '/',
    summary: 'create new word',
  })
  @ApiResponse({ status: 200, type: WordResponse })
  @AdminGuard()
  async create(@Body() dto: CreateWordDto): Promise<WordResponse> {
    return {
      word: await this.service.create(dto),
    };
  }

  @ApiSignature({
    method: 'PUT',
    path: '/:id',
    summary: 'update word',
  })
  @ApiParam({ name: 'id', description: 'word id' })
  @ApiResponse({ status: 200, type: WordResponse })
  @AdminGuard()
  async update(
    @Param('id') wordId: string,
    @Body() dto: UpdateWordDto,
  ): Promise<WordResponse> {
    return {
      word: await this.service.update(wordId, dto),
    };
  }
}

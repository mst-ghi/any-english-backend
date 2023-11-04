import { Body, Controller, Param, Query } from '@nestjs/common';
import { AdminGuard, ApiSignature, BaseResponse } from '@app/toolkit';
import { PhrasesService } from './phrases.service';
import { ApiParam, ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import { PhraseResponse, PhrasesResponse } from './phrases.responses';
import { CreatePhraseDto, UpdatePhraseDto } from './phrases.dto';

@ApiTags('phrases')
@Controller('phrases')
export class PhrasesController {
  constructor(private readonly service: PhrasesService) {}

  @ApiSignature({
    method: 'GET',
    path: '/',
    summary: 'phrase list',
    isPagination: true,
  })
  @ApiQuery({
    name: 'search',
    description: 'searching on phrase and meaning',
    required: false,
  })
  @ApiQuery({
    name: 'word_id',
    description: 'word id',
    required: false,
  })
  @ApiResponse({ status: 200, type: PhrasesResponse })
  async list(
    @Query('page') page: string,
    @Query('take') take: string,
    @Query('search') search: string,
    @Query('word_id') wordId: string,
  ): Promise<PhrasesResponse> {
    const { data, meta } = await this.service.list({
      page,
      take,
      search,
      wordId,
    });
    return {
      phrases: data,
      meta,
    };
  }

  @ApiSignature({
    method: 'POST',
    path: '/',
    summary: 'create new phrase',
  })
  @ApiResponse({ status: 200, type: PhraseResponse })
  @AdminGuard()
  async create(@Body() dto: CreatePhraseDto): Promise<PhraseResponse> {
    return {
      phrase: await this.service.create(dto),
    };
  }

  @ApiSignature({
    method: 'PUT',
    path: '/:id',
    summary: 'update phrase',
  })
  @ApiParam({ name: 'id', description: 'phrase id' })
  @ApiResponse({ status: 200, type: BaseResponse })
  @AdminGuard()
  async update(@Param('id') phraseId: string, @Body() dto: UpdatePhraseDto) {
    await this.service.update(phraseId, dto);
  }

  @ApiSignature({
    method: 'DELETE',
    path: '/:id',
    summary: 'delete phrase',
  })
  @ApiParam({ name: 'id', description: 'phrase id' })
  @ApiResponse({ status: 200, type: BaseResponse })
  @AdminGuard()
  async delete(@Param('id') phraseId: string) {
    await this.service.delete(phraseId);
  }
}

import { Controller, Query } from '@nestjs/common';
import { SearchService } from './search.service';
import { ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import { ApiSignature } from '@app/toolkit';
import { SearchResponse } from './search.responses';

@ApiTags('search')
@Controller('search')
export class SearchController {
  constructor(private readonly service: SearchService) {}

  @ApiSignature({
    method: 'GET',
    path: '/',
    summary: 'search api on words, phrases and conversations',
  })
  @ApiQuery({
    name: 'take',
    description: 'The number of items you want to fetched',
    required: false,
  })
  @ApiQuery({
    name: 'search',
    description: 'search value',
    required: false,
  })
  @ApiResponse({ status: 200, type: SearchResponse })
  async list(
    @Query('take') take: string,
    @Query('search') search: string,
  ): Promise<SearchResponse> {
    return await this.service.search({
      take: +take,
      search,
    });
  }
}

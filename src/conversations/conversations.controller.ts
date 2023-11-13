import { Body, Controller, Param, Query } from '@nestjs/common';
import { ConversationsService } from './conversations.service';
import { AdminGuard, ApiSignature, BaseResponse } from '@app/toolkit';
import { ApiParam, ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import {
  ConversationItemResponse,
  ConversationResponse,
  ConversationsResponse,
} from './conversations.responses';
import {
  CreateConversationDto,
  CreateConversationItemDto,
  UpdateConversationDto,
  UpdateConversationItemDto,
} from './conversations.dto';

@ApiTags('conversations')
@Controller('conversations')
export class ConversationsController {
  constructor(private readonly service: ConversationsService) {}

  @ApiSignature({
    method: 'GET',
    path: '/',
    summary: 'conversations list',
    isPagination: true,
  })
  @ApiQuery({
    name: 'search',
    description: 'searching on title',
    required: false,
  })
  @ApiResponse({ status: 200, type: ConversationsResponse })
  async list(
    @Query('page') page: string,
    @Query('take') take: string,
    @Query('search') search: string,
  ): Promise<ConversationsResponse> {
    const { data, meta } = await this.service.list({
      page,
      take,
      search,
    });
    return {
      conversations: data,
      meta,
    };
  }

  @ApiSignature({
    method: 'GET',
    path: '/:id',
    summary: 'conversation info',
  })
  @ApiParam({ name: 'id', description: 'conversation id' })
  @ApiResponse({ status: 200, type: ConversationResponse })
  async getOne(
    @Param('id') conversationId: string,
  ): Promise<ConversationResponse> {
    return {
      conversation: await this.service.show(conversationId),
    };
  }

  @ApiSignature({
    method: 'POST',
    path: '/',
    summary: 'create new conversation',
  })
  @ApiResponse({ status: 200, type: ConversationResponse })
  @AdminGuard()
  async create(
    @Body() dto: CreateConversationDto,
  ): Promise<ConversationResponse> {
    return {
      conversation: await this.service.create(dto),
    };
  }

  @ApiSignature({
    method: 'PUT',
    path: '/:id',
    summary: 'update conversation',
  })
  @ApiParam({ name: 'id', description: 'conversation id' })
  @ApiResponse({ status: 200, type: BaseResponse })
  @AdminGuard()
  async update(
    @Param('id') conversationId: string,
    @Body() dto: UpdateConversationDto,
  ) {
    await this.service.update(conversationId, dto);
  }

  @ApiSignature({
    method: 'POST',
    path: '/item',
    summary: 'create new conversation item',
  })
  @ApiResponse({ status: 200, type: ConversationItemResponse })
  @AdminGuard()
  async createItem(
    @Body() dto: CreateConversationItemDto,
  ): Promise<ConversationItemResponse> {
    return {
      item: await this.service.createItem(dto),
    };
  }

  @ApiSignature({
    method: 'PUT',
    path: '/:id/item',
    summary: 'update conversation item',
  })
  @ApiParam({ name: 'id', description: 'conversation item id' })
  @ApiResponse({ status: 200, type: BaseResponse })
  @AdminGuard()
  async updateItem(
    @Param('id') itemId: string,
    @Body() dto: UpdateConversationItemDto,
  ) {
    await this.service.updateItem(itemId, dto);
  }

  @ApiSignature({
    method: 'DELETE',
    path: '/:id/item',
    summary: 'delete conversation item',
  })
  @ApiParam({ name: 'id', description: 'conversation item id' })
  @ApiResponse({ status: 200, type: BaseResponse })
  @AdminGuard()
  async delete(@Param('id') itemId: string) {
    await this.service.deleteItem(itemId);
  }
}

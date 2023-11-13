import { BaseService } from '@app/toolkit';
import { Injectable } from '@nestjs/common';
import {
  CreateConversationDto,
  CreateConversationItemDto,
  UpdateConversationDto,
  UpdateConversationItemDto,
} from './conversations.dto';

@Injectable()
export class ConversationsService extends BaseService {
  async list(
    args: {
      page?: string;
      take?: string;
      search?: string;
    } = {},
  ) {
    const { page, take, search } = args;

    const query: any = {
      where: {},
      orderBy: { created_at: 'asc' },
    };

    if (search) {
      query['where']['OR'] = [{ title: { contains: search } }];
    }

    return this.prisma.paginate('conversation', { page, take }, query);
  }

  async show(conversationId: string) {
    return await this.getOneConversation(conversationId);
  }

  async create(dto: CreateConversationDto) {
    try {
      return await this.prisma.conversation.create({
        data: dto,
      });
    } catch (error) {
      this.catchError(error, ConversationsService.name);
    }
  }

  async update(conversationId: string, dto: UpdateConversationDto) {
    const conversation = await this.getOneConversation(conversationId);

    try {
      await this.prisma.conversation.update({
        where: { id: conversation.id },
        data: dto,
      });
    } catch (error) {
      this.catchError(error, ConversationsService.name);
    }
  }

  async createItem(dto: CreateConversationItemDto) {
    try {
      await this.prisma.conversationItem.create({
        data: dto,
      });
    } catch (error) {
      this.catchError(error, ConversationsService.name);
    }
  }

  async updateItem(itemId: string, dto: UpdateConversationItemDto) {
    const item = await this.getOneItem(itemId);

    try {
      await this.prisma.conversationItem.update({
        where: { id: item.id },
        data: dto,
      });
    } catch (error) {
      this.catchError(error, ConversationsService.name);
    }
  }

  async deleteItem(itemId: string) {
    const item = await this.getOneItem(itemId);

    try {
      await this.prisma.conversationItem.delete({
        where: { id: item.id },
      });
    } catch (error) {
      this.catchError(error, ConversationsService.name);
    }
  }

  async getOneConversation(conversationId: string, throwable = true) {
    const conversation = await this.prisma.conversation.findFirst({
      where: { id: conversationId },
      include: { items: true },
    });

    if (!conversation && throwable) {
      this.notFoundException();
    }

    return conversation;
  }

  async getOneItem(itemId: string, throwable = true) {
    const item = await this.prisma.conversationItem.findFirst({
      where: { id: itemId },
    });

    if (!item && throwable) {
      this.notFoundException();
    }

    return item;
  }
}

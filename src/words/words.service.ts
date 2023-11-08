import { BaseService } from '@app/toolkit';
import { Injectable } from '@nestjs/common';
import { CreateWordDto, UpdateWordDto } from './words.dto';

@Injectable()
export class WordsService extends BaseService {
  async list(
    args: {
      page?: string;
      take?: string;
      search?: string;
      userId?: string;
    } = {},
  ) {
    const { page, take, search, userId } = args;

    const query: any = {
      where: {},
      orderBy: { created_at: 'asc' },
      include: {
        phrases: true,
        lightners: {
          select: {
            id: true,
            user_id: true,
            word_id: true,
            phrase_id: true,
            level: true,
          },
        },
      },
    };

    if (search) {
      query['where']['OR'] = [
        { word: { contains: search } },
        { meaning: { contains: search } },
      ];
    }

    if (userId) {
      query['where']['lightners'] = {
        every: {
          user_id: userId,
        },
      };
    }

    return this.prisma.paginate('word', { page, take }, query);
  }

  async getOne(wordId: string, userId?: string) {
    const where = { id: wordId };

    if (userId) {
      where['lightners'] = {
        every: {
          user_id: userId,
        },
      };
    }

    const word = await this.prisma.word.findFirst({
      where,
      include: {
        phrases: true,
        lightners: {
          select: {
            id: true,
            user_id: true,
            word_id: true,
            phrase_id: true,
            level: true,
          },
        },
      },
    });

    if (!word) {
      this.notFoundException();
    }

    return word;
  }

  async create(dto: CreateWordDto) {
    try {
      return await this.prisma.word.create({ data: dto });
    } catch (error) {
      this.catchError(error, WordsService.name);
    }
  }

  async update(wordId: string, dto: UpdateWordDto) {
    const word = await this.prisma.word.findFirst({ where: { id: wordId } });

    if (!word) {
      this.notFoundException();
    }

    try {
      return await this.prisma.word.update({
        where: { id: word.id },
        data: dto,
        select: {
          id: true,
          word: true,
          meaning: true,
          created_at: true,
          phrases: true,
        },
      });
    } catch (error) {
      this.catchError(error, WordsService.name);
    }
  }
}

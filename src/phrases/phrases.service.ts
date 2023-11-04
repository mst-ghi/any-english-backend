import { BaseService } from '@app/toolkit';
import { Injectable } from '@nestjs/common';
import { CreatePhraseDto, UpdatePhraseDto } from './phrases.dto';

@Injectable()
export class PhrasesService extends BaseService {
  async list({
    page,
    take,
    search,
    wordId,
  }: {
    page?: string;
    take?: string;
    search?: string;
    wordId?: string;
  } = {}) {
    const query: any = {
      where: {},
      orderBy: { created_at: 'asc' },
    };

    if (wordId) {
      query.where['word_id'] = wordId;
    }

    if (search) {
      query['where']['OR'] = [
        { phrase: { contains: search } },
        { meaning: { contains: search } },
      ];
    }

    return this.prisma.paginate('phrase', { page, take }, query);
  }

  async create(dto: CreatePhraseDto) {
    try {
      return await this.prisma.phrase.create({ data: dto });
    } catch (error) {
      this.catchError(error, PhrasesService.name);
    }
  }

  async update(phraseId: string, dto: UpdatePhraseDto) {
    const phrase = await this.prisma.phrase.findFirst({
      where: { id: phraseId },
    });

    if (!phrase) {
      this.notFoundException();
    }

    try {
      await this.prisma.phrase.update({
        where: { id: phrase.id },
        data: dto,
      });
    } catch (error) {
      this.catchError(error, PhrasesService.name);
    }
  }

  async delete(phraseId: string) {
    const phrase = await this.prisma.phrase.findFirst({
      where: { id: phraseId },
    });

    if (!phrase) {
      this.notFoundException();
    }

    try {
      await this.prisma.phrase.delete({
        where: { id: phrase.id },
      });
    } catch (error) {
      this.catchError(error, PhrasesService.name);
    }
  }
}

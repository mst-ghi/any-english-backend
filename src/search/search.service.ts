import {
  BaseService,
  ConversationModel,
  PhraseModel,
  WordModel,
} from '@app/toolkit';
import { Injectable } from '@nestjs/common';

@Injectable()
export class SearchService extends BaseService {
  async search(args: { search?: string; take?: number }) {
    const search = args?.search;
    const take = args?.take || 8;

    let words: WordModel[] = [];
    let phrases: PhraseModel[] = [];
    let conversations: ConversationModel[] = [];

    try {
      words = await this.prisma.word.findMany({
        where: {
          OR: [
            { word: { contains: search } },
            { meaning: { contains: search } },
          ],
        },
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
        orderBy: { created_at: 'desc' },
        take,
      });

      phrases = await this.prisma.phrase.findMany({
        where: {
          OR: [
            { phrase: { contains: search } },
            { meaning: { contains: search } },
          ],
        },
        orderBy: { created_at: 'desc' },
        take,
      });

      conversations = await this.prisma.conversation.findMany({
        where: {
          OR: [
            { title: { contains: search } },
            { meaning: { contains: search } },
          ],
        },
        orderBy: { created_at: 'desc' },
        take,
      });
    } catch (error) {
      this.catchError(error, SearchService.name);
    }

    return {
      words,
      phrases,
      conversations,
    };
  }
}

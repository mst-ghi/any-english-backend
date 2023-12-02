import { BaseService } from '@app/toolkit';
import { Injectable } from '@nestjs/common';

@Injectable()
export class StatsService extends BaseService {
  async allStats() {
    return {
      words: await this.wordsCount(),
      phrases: await this.phrasesCount(),
      conversations: await this.conversationsCount(),
    };
  }

  async lastWord() {
    const words = await this.prisma.word.findMany({
      orderBy: { created_at: 'desc' },
      include: { phrases: true },
      take: 1,
    });
    return words ? words[0] : undefined;
  }

  async wordsCount() {
    return await this.prisma.word.count();
  }

  async phrasesCount() {
    return await this.prisma.phrase.count();
  }

  async conversationsCount() {
    return await this.prisma.conversation.count();
  }
}

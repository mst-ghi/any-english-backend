import { BaseService, LightnerLevelEnum, LightnerTypeEnum } from '@app/toolkit';
import { Injectable } from '@nestjs/common';
import { LightnerPhraseDto, LightnerWordDto } from './lightner.dto';

@Injectable()
export class LightnerService extends BaseService {
  async list({
    userId,
    page,
    take,
    type,
    level,
  }: {
    userId: string;
    page?: string;
    take?: string;
    type?: LightnerTypeEnum;
    level?: number;
  }) {
    const query: any = {
      where: {
        user_id: userId,
      },
      include: {
        word: {
          select: {
            id: true,
            word: true,
            meaning: true,
            lightners: {
              where: {
                user_id: userId,
              },
            },
          },
        },
        phrase: {
          select: {
            id: true,
            phrase: true,
            meaning: true,
            lightners: {
              where: {
                user_id: userId,
              },
            },
          },
        },
      },
      orderBy: { created_at: 'asc' },
    };

    if (level) {
      query.where['level'] = level;
    }

    if (type) {
      if (type === LightnerTypeEnum.Word) {
        query.where['phrase_id'] = { equals: null };
      } else if (type === LightnerTypeEnum.Phrase) {
        query.where['word_id'] = { equals: null };
      }
    }

    this.prisma.lightner.findMany({
      where: {
        word_id: {
          equals: null,
        },
      },
    });

    return this.prisma.paginate('lightner', { page, take }, query);
  }

  async upsertWord(userId: string, dto: LightnerWordDto) {
    try {
      const lightner = await this.prisma.lightner.findFirst({
        where: { user_id: userId, word_id: dto.word_id },
      });

      if (lightner && dto.level === LightnerLevelEnum.Level0) {
        await this.prisma.lightner.delete({
          where: { id: lightner.id },
        });
      } else {
        if (lightner) {
          await this.prisma.lightner.update({
            where: { id: lightner.id },
            data: { word_id: dto.word_id, level: dto.level },
          });
        } else {
          await this.prisma.lightner.create({
            data: {
              user_id: userId,
              word_id: dto.word_id,
              level: dto.level,
            },
          });
        }
      }
    } catch (error) {
      this.catchError(error, LightnerService.name);
    }
  }

  async upsertPhrase(userId: string, dto: LightnerPhraseDto) {
    try {
      const lightner = await this.prisma.lightner.findFirst({
        where: { user_id: userId, phrase_id: dto.phrase_id },
      });

      if (lightner && dto.level === LightnerLevelEnum.Level0) {
        await this.prisma.lightner.delete({
          where: { id: lightner.id },
        });
      } else {
        if (lightner) {
          await this.prisma.lightner.update({
            where: { id: lightner.id },
            data: { phrase_id: dto.phrase_id, level: dto.level },
          });
        } else {
          await this.prisma.lightner.create({
            data: {
              user_id: userId,
              phrase_id: dto.phrase_id,
              level: dto.level,
            },
          });
        }
      }
    } catch (error) {
      this.catchError(error, LightnerService.name);
    }
  }
}

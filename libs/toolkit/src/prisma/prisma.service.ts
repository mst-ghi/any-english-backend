import { PrismaClient } from '@prisma/client';
import { Global, Injectable, Logger } from '@nestjs/common';

export interface PaginatedResult<T> {
  data: T[];
  meta: {
    total_docs: number;
    take: number;
    total_pages: number;
    page: number;
    paging_counter?: number;
    has_prev_page: boolean;
    has_next_page: boolean;
    prev: number;
    next: number;
  };
}
export type PaginateOptions = { page?: string; take?: string };

export const prismaPaginationQuery = (
  page?: string,
  take?: string,
): { skip: number; take: number; page: number } => {
  let pageNum = 1;
  let takeNum = 25;

  try {
    if (page) {
      pageNum = parseInt(page, 10);
    }
  } catch (error) {
    Logger.error('Error in pagination query in page value: ', error);
  }
  try {
    if (take) {
      takeNum = parseInt(take, 10);
    }
  } catch (error) {
    Logger.error('Error in pagination query in take value: ', error);
  }

  return {
    skip: pageNum > 0 ? (pageNum - 1) * takeNum : 0,
    take: takeNum,
    page: pageNum,
  };
};

@Global()
@Injectable()
export class PrismaService extends PrismaClient {
  tables: string[];

  constructor() {
    super({ errorFormat: 'minimal' });
  }

  async paginate<T>(
    model: string,
    options: PaginateOptions,
    query: any = { where: undefined },
  ): Promise<PaginatedResult<T>> {
    const prismaModel = this[model];

    const { page, take, skip } = prismaPaginationQuery(
      options.page,
      options.take,
    );

    const [total, data] = await Promise.all([
      prismaModel.count({ where: query.where }),
      prismaModel.findMany({
        ...query,
        take,
        skip,
      }),
    ]);

    const lastPage = Math.ceil(total / take);
    const prev = page > 1 ? page - 1 : null;
    const next = page < lastPage ? page + 1 : null;

    return {
      data,
      meta: {
        total_docs: total,
        total_pages: lastPage,
        page,
        take,
        prev,
        has_prev_page: Boolean(prev),
        next,
        has_next_page: Boolean(next),
      },
    };
  }
}

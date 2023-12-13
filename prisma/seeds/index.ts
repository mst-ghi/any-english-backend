import { Logger } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

import UsersDataSeeder from './users.seed';
import WordsDataSeeder from './words.seed';
import PhrasesDataSeeder from './phrases.seed';
import ConversationsDataSeeder from './conversations.seed';
import ConversationItemsDataSeeder from './conversation-items.seed';
import LightnerDataSeeder from './lightner.seed';

const prisma = new PrismaClient();

async function main() {
  Logger.verbose(`Start seeding ...`, 'Prisma Seeding');

  await UsersDataSeeder(prisma);
  await WordsDataSeeder(prisma);
  await PhrasesDataSeeder(prisma);
  await ConversationsDataSeeder(prisma);
  await ConversationItemsDataSeeder(prisma);
  await LightnerDataSeeder(prisma);

  Logger.verbose(`Seeding finished.`, 'Prisma Seeding');
}

main()
  .catch((e) => {
    Logger.error(e.message, 'Prisma Seeding');
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });

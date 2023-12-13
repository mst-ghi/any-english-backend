import { Logger } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { catchLogger } from './utils';
import { readFileSync } from 'fs';
import { join } from 'path';

const truncateString = (string = '', maxLength = 70) =>
  string.length > maxLength ? `${string.substring(0, maxLength)}…` : string;

const data = JSON.parse(
  readFileSync(join(__dirname, 'json/conversation-items.json'), 'utf-8'),
);

const ConversationItemsDataSeeder = async (prisma: PrismaClient) => {
  console.log('');

  for (const item of data) {
    try {
      await prisma.conversationItem.upsert({
        where: { id: item.id },
        create: item,
        update: item,
      });
      Logger.debug(
        `Updated conversation-item: ${truncateString(item.phrase)}`,
        'ConversationItemsDataSeeder',
      );
    } catch (error) {
      catchLogger(error, item.phrase);
    }
  }
};

export default ConversationItemsDataSeeder;

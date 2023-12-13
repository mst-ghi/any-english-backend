import { Logger } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { catchLogger } from './utils';
import { readFileSync } from 'fs';
import { join } from 'path';

const data = JSON.parse(
  readFileSync(join(__dirname, 'json/conversations.json'), 'utf-8'),
);

const ConversationsDataSeeder = async (prisma: PrismaClient) => {
  console.log('');

  for (const conversation of data) {
    try {
      await prisma.conversation.upsert({
        where: { id: conversation.id },
        create: conversation,
        update: conversation,
      });
      Logger.debug(
        `Updated conversation: ${conversation.title}`,
        'ConversationsDataSeeder',
      );
    } catch (error) {
      catchLogger(error, conversation.title);
    }
  }
};

export default ConversationsDataSeeder;

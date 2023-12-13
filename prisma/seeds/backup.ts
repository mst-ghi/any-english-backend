import { writeFile } from 'fs';
import { Logger } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

const writeDataToFile = async (label: string, path: string, data?: any) => {
  if (data) {
    const fullPath = __dirname + path;
    writeFile(fullPath, JSON.stringify(data, null, 2), 'utf8', (err) => {
      if (err) return Logger.error(err.message, 'Prisma Backup');
      Logger.verbose(`${label} JSON Backup file updated.`, 'Prisma Backup');
    });
  }
};

const backupUsers = async (prisma: PrismaClient) => {
  const users = await prisma.user.findMany();
  writeDataToFile('Users', '/json/users.json', users);
};

const backupWords = async (prisma: PrismaClient) => {
  const words = await prisma.word.findMany();
  writeDataToFile('Words', '/json/words.json', words);
};

const backupPhrases = async (prisma: PrismaClient) => {
  const phrases = await prisma.phrase.findMany();
  writeDataToFile('Phrases', '/json/phrases.json', phrases);
};

const backupConversations = async (prisma: PrismaClient) => {
  const conversations = await prisma.conversation.findMany();
  writeDataToFile('Conversations', '/json/conversations.json', conversations);
};

const backupConversationItems = async (prisma: PrismaClient) => {
  const items = await prisma.conversationItem.findMany();
  writeDataToFile('Conversation Items', '/json/conversation-items.json', items);
};

const backupLightner = async (prisma: PrismaClient) => {
  const lightner = await prisma.lightner.findMany();
  writeDataToFile('Lightner', '/json/lightner.json', lightner);
};

const prisma = new PrismaClient();

async function main() {
  Logger.verbose(`Start backup ...`, 'Prisma Backup');

  await backupUsers(prisma);
  await backupWords(prisma);
  await backupPhrases(prisma);
  await backupConversations(prisma);
  await backupConversationItems(prisma);
  await backupLightner(prisma);
}

main()
  .catch((e) => {
    Logger.error(e.message, 'Prisma Backup');
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });

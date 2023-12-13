import { Logger } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { catchLogger } from './utils';
import { readFileSync } from 'fs';
import { join } from 'path';

const data = JSON.parse(
  readFileSync(join(__dirname, 'json/phrases.json'), 'utf-8'),
);

const PhrasesDataSeeder = async (prisma: PrismaClient) => {
  console.log('');

  for (const phrase of data) {
    try {
      await prisma.phrase.upsert({
        where: { id: phrase.id },
        create: phrase,
        update: phrase,
      });
      Logger.debug(`Updated phrase: ${phrase.phrase}`, 'PhrasesDataSeeder');
    } catch (error) {
      catchLogger(error, phrase.phrase);
    }
  }
};

export default PhrasesDataSeeder;

import { Logger } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { catchLogger } from './utils';
import { readFileSync } from 'fs';
import { join } from 'path';

const data = JSON.parse(
  readFileSync(join(__dirname, 'json/words.json'), 'utf-8'),
);

const WordsDataSeeder = async (prisma: PrismaClient) => {
  console.log('');

  for (const word of data) {
    try {
      await prisma.word.upsert({
        where: { id: word.id },
        create: word,
        update: word,
      });
      Logger.debug(`Updated word: ${word.word}`, 'WordsDataSeeder');
    } catch (error) {
      catchLogger(error, word.word);
    }
  }
};

export default WordsDataSeeder;

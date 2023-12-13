import { Logger } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { catchLogger } from './utils';
import { readFileSync } from 'fs';
import { join } from 'path';

const data = JSON.parse(
  readFileSync(join(__dirname, 'json/lightner.json'), 'utf-8'),
);

const LightnerDataSeeder = async (prisma: PrismaClient) => {
  console.log('');

  for (const lightner of data) {
    try {
      await prisma.lightner.upsert({
        where: { id: lightner.id },
        create: lightner,
        update: lightner,
      });
      Logger.debug(
        `Updated lightner with ID: ${lightner.id}`,
        'LightnerDataSeeder',
      );
    } catch (error) {
      catchLogger(error, lightner.id);
    }
  }
};

export default LightnerDataSeeder;

import { Logger } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { catchLogger } from './utils';
import { readFileSync } from 'fs';
import { join } from 'path';

const data = JSON.parse(
  readFileSync(join(__dirname, 'json/users.json'), 'utf-8'),
);

const UsersDataSeeder = async (prisma: PrismaClient) => {
  console.log('');

  for (const user of data) {
    try {
      await prisma.user.upsert({
        where: { id: user.id },
        create: user,
        update: user,
      });
      Logger.debug(`Updated user with email: ${user.email}`, 'UsersDataSeeder');
    } catch (error) {
      catchLogger(error, user.email);
    }
  }
};

export default UsersDataSeeder;

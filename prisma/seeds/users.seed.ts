import { Logger } from '@nestjs/common';
import { PrismaClient, Prisma } from '@prisma/client';
import { catchLogger, stringToHash } from './utils';
import { readFileSync } from 'fs';
import { join } from 'path';

const data = JSON.parse(
  readFileSync(join(__dirname, 'json/users.json'), 'utf-8'),
);

const UsersData: Prisma.UserCreateInput[] = [];

for (let index = 0; index < data.length; index++) {
  const user = data[index];
  UsersData.push(user);
}

const UsersDataSeeder = async (prisma: PrismaClient) => {
  console.log('');

  for (const user of UsersData) {
    try {
      let result = await prisma.user.findFirst({
        where: { email: user.email },
      });
      if (result) {
        result = await prisma.user.update({
          where: { id: user.id },
          data: {
            email: user.email,
            fullname: user.fullname,
            access: user.access,
            status: user.status,
            password: stringToHash(user.password || '12345678'),
          },
        });
        Logger.debug(
          `Updated user with email: ${result.email}`,
          'UsersDataSeeder',
        );
      } else {
        result = await prisma.user.create({
          data: {
            ...user,
            password: stringToHash(user.password || '12345678'),
          },
        });
        Logger.log(
          `Created user with email: ${result.email}`,
          'UsersDataSeeder',
        );
      }
    } catch (error) {
      catchLogger(error, user.email);
    }
  }
};

export default UsersDataSeeder;

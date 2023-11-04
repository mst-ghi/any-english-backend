import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { NestExpressApplication } from '@nestjs/platform-express';
import { ConfigService } from '@nestjs/config';
import { Logger, VersioningType } from '@nestjs/common';
import {
  SwaggerStarter,
  UseCorsConfig,
  UseGlobalValidationPipe,
  UseMainMiddlewares,
  UseGlobalFilters,
} from '@app/toolkit';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule, {
    logger: ['log', 'error', 'verbose', 'warn'],
  });

  const configs = app.get(ConfigService);

  app.enableVersioning({
    type: VersioningType.URI,
  });

  app.setGlobalPrefix('api');

  UseCorsConfig.use(app);
  UseMainMiddlewares.use(app);
  UseGlobalFilters.use(app, process.env.NODE_ENV != 'development');
  UseGlobalValidationPipe.use(app);
  SwaggerStarter.start(app, configs.get('swagger.path'));

  await app.listen(configs.get('app.port'), '0.0.0.0', () => {
    Logger.log(
      `Core is running on ${configs.get('app.port')}`,
      'NestApplication',
    );
  });
}
bootstrap();

import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';

import AppConfigs from './app.configs';

import {
  BaseServiceModule,
  ClassSerializerProvider,
  JwtModule,
  PrismaModule,
  Sha256Module,
  TransformProvider,
} from '@app/toolkit';

import { AuthModule } from './auth/auth.module';
import { WordsModule } from './words/words.module';
import { PhrasesModule } from './phrases/phrases.module';
import { StatsModule } from './stats/stats.module';
import { LightnerModule } from './lightner/lightner.module';
import { ConversationsModule } from './conversations/conversations.module';
import { SearchModule } from './search/search.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      envFilePath: '.env',
      isGlobal: true,
      load: [AppConfigs],
    }),
    Sha256Module.register({
      secret: AppConfigs().sha256.secret,
    }),
    PrismaModule,
    BaseServiceModule,
    JwtModule,
    AuthModule,
    WordsModule,
    PhrasesModule,
    StatsModule,
    LightnerModule,
    ConversationsModule,
    SearchModule,
  ],
  providers: [ClassSerializerProvider, TransformProvider],
})
export class AppModule {}

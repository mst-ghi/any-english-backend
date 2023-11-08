import { Module } from '@nestjs/common';
import { LightnerService } from './lightner.service';
import { LightnerController } from './lightner.controller';

@Module({
  controllers: [LightnerController],
  providers: [LightnerService],
})
export class LightnerModule {}

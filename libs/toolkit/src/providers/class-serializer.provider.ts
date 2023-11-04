import { ClassSerializerInterceptor } from '@nestjs/common';
import { APP_INTERCEPTOR } from '@nestjs/core';

export const ClassSerializerProvider = {
  provide: APP_INTERCEPTOR,
  useClass: ClassSerializerInterceptor,
};

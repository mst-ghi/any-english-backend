import { APP_INTERCEPTOR } from '@nestjs/core';
import { TransformInterceptor } from '../interceptors';

export const TransformProvider = {
  provide: APP_INTERCEPTOR,
  useClass: TransformInterceptor,
};

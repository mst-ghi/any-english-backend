import { Global, Inject, Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PrismaService } from '../prisma';
import {
  throwBadRequest,
  throwForbidden,
  throwInternalServerError,
  throwInvalidToken,
  throwLimitedUnAuthorized,
  throwMethodNotAllowed,
  throwNotFound,
  throwServiceUnAvailable,
  throwUnAuthorized,
  throwUnprocessableEntity,
} from '../errors';

const errorLogger = (message: string, context?: string) => {
  Logger.error(message, context);
};

@Global()
@Injectable()
export class BaseService {
  @Inject(ConfigService)
  protected configs: ConfigService;

  @Inject(PrismaService)
  protected prisma: PrismaService;

  forbiddenException(message?: string) {
    throwForbidden(message);
  }

  unAuthorizedException(message?: string) {
    throwUnAuthorized(message);
  }

  limitedUnAuthorizedException(message?: string) {
    throwLimitedUnAuthorized(message);
  }

  badRequestException(message?: string) {
    throwBadRequest(message);
  }

  notFoundException(message?: string) {
    throwNotFound(message);
  }

  methodNotAllowedException(message?: string) {
    throwMethodNotAllowed(message);
  }

  internalServerErrorException(message?: string) {
    throwInternalServerError(message);
  }

  serviceUnAvailableException(message?: string) {
    throwServiceUnAvailable(message);
  }

  unprocessableEntityException(fields: string[], message?: string) {
    const errors = [];
    for (const field of fields) {
      errors.push({ field, message });
    }
    throwUnprocessableEntity(errors);
  }

  invalidTokenException(message?: string) {
    throwInvalidToken(message);
  }

  catchError(error: any, ctx = 'Service') {
    errorLogger(error.message, ctx);
    this.internalServerErrorException();
  }
}

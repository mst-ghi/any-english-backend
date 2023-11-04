import * as compression from 'compression';
import helmet from 'helmet';
import * as morgan from 'morgan';
import { json, urlencoded } from 'express';
import { Logger } from '@nestjs/common';
import { NestExpressApplication } from '@nestjs/platform-express';

export const Morgan = morgan((tokens: any, req: any, res: any) => {
  const method = tokens.method(req, res);
  const status = +tokens.status(req, res);
  const url = tokens.url(req, res);
  const time = tokens['response-time'](req, res);

  const log = `${method} | ${status} | ${time}ms | ${url}`;

  if (status >= 400 && status < 500) {
    Logger.warn(log, 'RequestLogger');
  } else if (status >= 500 && status < 600) {
    Logger.error(log, 'RequestLogger');
  } else {
    Logger.log(log, 'RequestLogger');
  }
});

export class UseMainMiddlewares {
  static use(app: NestExpressApplication) {
    app.use(
      helmet({
        crossOriginResourcePolicy: false,
      }),
    );
    app.use(compression());
    app.use(Morgan);
    app.use(json({ limit: '5mb' }));
    app.use(urlencoded({ extended: true, limit: '5mb' }));
  }
}

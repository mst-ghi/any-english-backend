import {
  DocumentBuilder,
  SwaggerDocumentOptions,
  SwaggerModule,
} from '@nestjs/swagger';
import { CustomCss } from './swagger.css';

export class SwaggerStarter {
  static start(app: any, path = 'docs', options?: SwaggerDocumentOptions) {
    const config = new DocumentBuilder();
    config.setTitle(`Any English APIs`).setVersion('1.0').addBearerAuth();
    const document = SwaggerModule.createDocument(app, config.build(), options);
    SwaggerModule.setup(path, app, document, {
      customCss: CustomCss,
      swaggerOptions: {
        docExpansion: 'none',
        layout: 'StandaloneLayout',
      },
    });
  }
}

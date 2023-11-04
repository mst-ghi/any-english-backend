export default () => ({
  mode: process.env.NODE_ENV,

  app: {
    port: parseInt(process.env.APP_PORT, 10) || 3000,
  },

  swagger: {
    path: process.env.SWAGGER_API_PATH || 'docs',
  },

  sha256: {
    secret:
      process.env.SHA256_SECRET ||
      'x58dX2rk25^puu!35B?kP!cY.w&3X4Nxn?47YNSTL9bcx@xzV6CKvAtf',
  },

  jwt: {
    tokenTtl: parseInt(process.env.TOKEN_EXPIRES_HOUR, 10) || 120,
    rTokenTtl: parseInt(process.env.REFRESH_TOKEN_EXPIRES_HOUR, 10) || 120,
  },
});

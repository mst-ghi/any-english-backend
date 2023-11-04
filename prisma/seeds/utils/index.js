"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.stringToHash = exports.catchLogger = void 0;
var common_1 = require("@nestjs/common");
var client_1 = require("@prisma/client");
var js_sha3_1 = require("js-sha3");
var catchLogger = function (error, model) {
    if (error instanceof client_1.Prisma.PrismaClientKnownRequestError) {
        common_1.Logger.error("".concat(model, ": code ").concat(error.code), "Prisma Seeding");
    }
    else {
        common_1.Logger.error(error.message, "Prisma ".concat(model, " Seeding"));
    }
};
exports.catchLogger = catchLogger;
var stringToHash = function (str) {
    return (0, js_sha3_1.sha3_256)((0, js_sha3_1.sha3_256)(str));
};
exports.stringToHash = stringToHash;

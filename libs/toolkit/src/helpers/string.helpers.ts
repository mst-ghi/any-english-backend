import { sha3_256 } from 'js-sha3';
import toSlug from 'slugify';
import { v4 as uuidv4 } from 'uuid';

export const stringToHash = (str: string): string => {
  return sha3_256(sha3_256(str));
};

export const randomStr = (
  length,
  prefix = '',
  chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789',
) => {
  let result = '';
  const characters = chars;
  const charactersLength = characters.length;
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return prefix + result;
};

export const slugify = (str: string, separator = '-'): string => {
  return toSlug(str, separator);
};

export const uuid = (): string => {
  return uuidv4();
};

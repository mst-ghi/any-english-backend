/*
  Warnings:

  - A unique constraint covering the columns `[user_id,word_id,phrase_id]` on the table `lightner` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "lightner_user_id_word_id_phrase_id_idx";

-- CreateIndex
CREATE UNIQUE INDEX "lightner_user_id_word_id_phrase_id_key" ON "lightner"("user_id", "word_id", "phrase_id");

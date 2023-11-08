-- DropForeignKey
ALTER TABLE "phrases" DROP CONSTRAINT "phrases_word_id_fkey";

-- AlterTable
ALTER TABLE "phrases" ALTER COLUMN "word_id" DROP NOT NULL;

-- CreateTable
CREATE TABLE "lightner" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "word_id" TEXT,
    "phrase_id" TEXT,
    "level" SMALLINT NOT NULL DEFAULT 4,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "lightner_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "phrases" ADD CONSTRAINT "phrases_word_id_fkey" FOREIGN KEY ("word_id") REFERENCES "words"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lightner" ADD CONSTRAINT "lightner_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lightner" ADD CONSTRAINT "lightner_word_id_fkey" FOREIGN KEY ("word_id") REFERENCES "words"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lightner" ADD CONSTRAINT "lightner_phrase_id_fkey" FOREIGN KEY ("phrase_id") REFERENCES "phrases"("id") ON DELETE SET NULL ON UPDATE CASCADE;

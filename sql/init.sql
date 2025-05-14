-- Prismaが使用するユーザー作成
CREATE USER prismauser WITH PASSWORD 'prismapassword';
ALTER ROLE prismauser SET CLIENT_ENCODING TO 'utf8';
ALTER ROLE prismauser SET DEFAULT_TRANSACTION_ISOLATION TO 'read committed';
ALTER ROLE prismauser SET TIMEZONE TO 'Asia/Tokyo';
-- prisma migrateする際に必要な権限
-- https://www.prisma.io/docs/concepts/components/prisma-migrate/shadow-database#shadow-database-user-permissions
ALTER ROLE prismauser CREATEDB;

-- DATABASE作成
CREATE DATABASE prismadb;

-- 作成したDBへ切り替え
\c prismadb

-- スキーマ作成
CREATE SCHEMA prismaschema;

-- 権限追加
GRANT CREATE ON DATABASE prismadb TO prismauser;
GRANT USAGE ON SCHEMA prismaschema TO prismauser;
GRANT CREATE ON SCHEMA prismaschema TO prismauser;
GRANT DELETE, INSERT, SELECT, UPDATE ON ALL TABLES IN SCHEMA prismaschema TO prismauser;
GRANT SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA prismaschema TO prismauser;

# ベースイメージ（軽量 Alpine Linux ベースの Node.js 20）
FROM node:20-alpine

# 必要なパッケージのインストール
RUN apk add --no-cache git g++ make python3 py3-pip

# 作業ディレクトリを指定
WORKDIR /app

# package.json / package-lock.json を先にコピー（キャッシュ活用のため）
COPY package.json package-lock.json* ./

# npm のバージョン指定（任意）
RUN npm install -g npm@9.7.2 node-gyp

# 依存パッケージのインストール（--legacy-peer-deps は必要な場合のみ）
#RUN npm install --legacy-peer-deps

# prisma関連
RUN npm install prisma --save-dev
RUN npm install @prisma/client

# RUN npx prisma init

# 残りのアプリファイルをコピー
COPY . .

# ポート開放（Next.jsのデフォルトポート）
EXPOSE 3000

# 開発用起動コマンド（通常は docker-compose.yml で上書き）
CMD ["npm", "run", "dev"]

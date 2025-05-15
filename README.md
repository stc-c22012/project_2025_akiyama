
## セッティング手順

- ローカル環境にレポジトリをクローン
<p>ターミナルで以下を実行</p>

```
git clone (レポジトリのURL)
```

- 環境変数を設定
<p>.envファイルをルートディレクトリ直下に作成し、以下を追記</p>

```
#　/project_2025_akiyama/.env
DB_HOST=db
DB_NAME=mydb
DB_USER=admin
DB_PASS=password
DATABASE_URL="postgresql://${DB_USER}:${DB_PASS}@db:5432/${DB_NAME}?schema=public"
```

- コンテナをビルド
<p> ターミナルで以下のコマンドを実行</p>

```
docker compose build
```

- コンテナを起動
<p> ターミナルで以下のコマンドを実行してコンテナを起動</p>

```
docker compose up
```
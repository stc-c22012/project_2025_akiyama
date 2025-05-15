環境変数

#.env
```
DB_HOST=db
DB_NAME=mydb
DB_USER=admin
DB_PASS=password
DATABASE_URL="postgresql://${DB_USER}:${DB_PASS}@db:5432/${DB_NAME}?schema=public"
```
localhost:3000にアクセスします。

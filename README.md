https://master--roaring-liger-4fccc9.netlify.app/

(静的ホスティング)

## 概要 
一人用の神経衰弱ゲーム
| | |
|---|---|
|![スクリーンショット 2020-08-01 15 53 36](https://user-images.githubusercontent.com/53789788/89096327-e123b380-d410-11ea-9131-0ac5461f12ef.png)|![スクリーンショット 2020-08-01 15 54 07](https://user-images.githubusercontent.com/53789788/89096373-34960180-d411-11ea-90fe-ec05a05f9404.png)|
| | |
|![スクリーンショット 2020-08-01 15 57 05](https://user-images.githubusercontent.com/53789788/89096784-24cbec80-d414-11ea-8cd8-d6ef77e298ef.png)|![スクリーンショット 2020-08-01 15 57 26](https://user-images.githubusercontent.com/53789788/89096871-dcf99500-d414-11ea-9aab-fb9216268282.png)|
|||
|![スクリーンショット 2020-08-01 15 58 14](https://user-images.githubusercontent.com/53789788/89096898-1df1a980-d415-11ea-96b3-425b30bd6a05.png)||
## 技術仕様
- 基盤
  - Dockerコンテナ
- バックエンド
  - RubyOnRails
- フロントエンド
  - Vue.js

## 環境構築
```
docker-compose build;
docker-compose run --rm web bundle install;
docker-compose run --rm front npm install;
docker-compose up -d;
docker-compose run --rm web rails db:create;
docker-compose run --rm web rails db:migrate;
docker-compose run --rm web rails db:seed_fu;
```

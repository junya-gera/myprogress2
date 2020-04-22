# MyProgress

自身の転職活動用に開発したポートフォリオアプリです。
勉強や作業などの毎日のタスクをカレンダーで管理します。
また、登録したタスクを全て完了すると完成するタスクパズルで楽しくタスクに取り組むことができます。

# 制作の背景
毎日の勉強計画を簡単に立てられ、またパズルを完成させるという目的を持たせることで
楽しくタスクに取り組む習慣をつける手助けになれば良いなと思い作りました。

# 本番環境URL

# 使用技術
- Haml,Sass,jQuery
- Ruby 2.5.1
- Ruby on Rails 5.2.4
- AWS(VPC,EC2,RDS,Route53)
- Nginx,unicorn
- RSpec
- Rubocop

# 機能一覧

# 工夫したポイント

# 今後について

# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|
|email|string|null: false|unique: true|
|password|string|null: false|unique: true|

### Association
- has_many :puzzles

## puzzlesテーブル

|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :tasks
- belongs_to :user


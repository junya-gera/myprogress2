# MyProgress

自身の転職活動用に開発したポートフォリオアプリです。
勉強や作業などの毎日のタスクをカレンダーで管理します。
また、登録したタスクを全て完了すると完成するタスクパズルで楽しくタスクに取り組むことができます。

# 制作の背景
毎日の勉強計画を簡単に立てられ、またパズルを完成させるという目的を持たせることで
楽しくタスクに取り組む習慣をつける手助けになれば良いなと思い作りました。
勉強や自身のタスクに継続的に取り組むには、やる気やモチベーションだけではなく、
それらを促すシステムが必要だと思ったからです。

# 本番環境URL
http://www.myprogress2.xyz.

ログイン画面のかんたんログインをクリックすることで、ゲストユーザーとしてログインできます。

# 使用技術
- Haml,Sass,jQuery
- FullCalendar,canvas
- Ruby 2.5.1
- Ruby on Rails 5.2.4
- AWS(VPC,EC2,RDS,Route53,S3)
- Nginx,unicorn
- RSpec
- Rubocop

# 機能一覧
- ユーザー登録、SNS(Facebook、Google)認証、ログイン、編集、一覧機能
- タスク登録機能、カレンダー上にタスクの表示
- タスクパズル
  - 9つのタスクを登録し、完了ボタンを押せばパズルのマスが1つ外れます。全て完了したら中の絵が現れます。

![myprogress1](https://i.gyazo.com/18c510cc2669fd0ad28d1389ae969dda.png)

![myprogress2](https://i.gyazo.com/f615f1b9fe9c4f695ea96c41f6ea733c.png)
![タスクパズル](https://user-images.githubusercontent.com/60377569/79971695-a6d07f00-84cf-11ea-853c-a35a2fa27966.gif)


# 工夫したポイント
- canvasを使用した、9つのマスでできたパズルの実装
- ユーザーごとのカレンダー表示

# 今後について (4/24時点)
## 追加したい機能
  - デプロイ、自動デプロイ
  - タスクが達成できた日をクリックすると色が変わり、自分の進捗を一目で確認できる
  - ユーザーが好きな画像をパズルの絵に登録できる
## コードについて
  - リファクタリング、DRY原則の実践（特にパズル機能）
  - コントローラの記述をモデルメソッドに移行

# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|image|string|
|email|string|null: false|unique: true|
|password|string|null: false|unique: true|

### Association
- has_many :events
- has_many :puzzles

## eventsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|
|content|text|
|start_date|datetime|
|end_date|datetime|
|user_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user

## puzzlesテーブル

|Column|Type|Options|
|------|----|-------|
|square|boolean|null: false, default: false|
|task|string|
|user_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user

## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string|
|user_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user

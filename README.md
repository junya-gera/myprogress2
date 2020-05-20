# MyProgress

自身の転職活動用に開発したポートフォリオアプリです。<br>
勉強や作業などの毎日のタスクをカレンダーで管理します。<br>
また、登録したタスクを全て完了すると完成するタスクパズルで楽しくタスクに取り組むことができます。

# 制作の背景
毎日の勉強計画を簡単に立てられ、またパズルを完成させるという目的を持たせることで
楽しくタスクに取り組む習慣をつける手助けになれば良いなと思い作りました。<br>
勉強や自身のタスクに継続的に取り組むには、やる気やモチベーションだけではなく、
それらを促すシステムが必要だと思ったからです。<br>
また、難しい課題や大変な作業を効率よく進めるには、課題を可能な限り小さなタスクに分割し、
優先順位をつけて1つずつ取り組むといったやり方がいいと考えています。<br>
機能の1つであるタスクパズルではこの考えに則り、マスが9つあることで必ず9つまで課題を分割する必要があります。


# 本番環境URL
https://www.myprogress2.xyz.

ログイン画面のかんたんログインをクリックすることで、ゲストユーザーとしてログインできます。

# 使用技術
- Haml,Sass,jQuery
- FullCalendar,canvas
- Ruby 2.5.1
- Ruby on Rails 5.2.4
- AWS(VPC/EC2/RDS/Route53/S3/ACM)
- Nginx,unicorn
- RSpec
- Rubocop

# 機能一覧
- ユーザー機能
  - deviseを使用
  - 新規登録、ログイン、ログアウト機能
  - 一覧表示機能
    - 他のユーザーのタスクを参考にできるようにするため
  - Facebook、Googleアカウントによる認証機能（本番環境では未実装）
    - ユーザー新規登録の際にメールアドレスやパスワードなどを入力する手間を省いてアプリのUXを向上させるため
    <br>
- タスク登録機能、カレンダー上にタスクの表示
  - 完了する日時から逆算した学習計画を立て、毎日の作業内容を明確化するため
  - その日の予定を全てこなせた日をクリックすることで色が変わり、自身の成果を可視化することで作業への意欲を向上させるため（5/20 未実装）
  <br>
- タスクパズル
  - 9つのタスクを登録し、完了ボタンを押せばパズルのマスが1つ外れ、全て完了したら中の絵が現れる
  - 絵を完成させるという、課題に取り組む動機付けにするため
  - 課題を9つ用意、または9つまで分割する必要があるので、難しい課題であっても小さなタスクに分割するきっかけにするため
  - 5/20 現在、パズルの開閉をDBに保存することができません。

![myprogress1](https://i.gyazo.com/18c510cc2669fd0ad28d1389ae969dda.png)

![myprogress2](https://i.gyazo.com/f615f1b9fe9c4f695ea96c41f6ea733c.png)
![タスクパズル](https://user-images.githubusercontent.com/60377569/79971695-a6d07f00-84cf-11ea-853c-a35a2fa27966.gif)


# 工夫したポイント
- canvasを使用した、9つのマスでできたパズルの実装
- ユーザーごとのタスクが登録されたカレンダーの表示

# 今後について (5/20時点)
## 追加したい機能
  - Docker導入
  - CircleCI(CI/CDパイプラインを構築)
  - 本番環境でのSNS(Facebook、Google)認証
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

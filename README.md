# アプリ名
記念日リマインダー「 Anniversary Reminder 」
# 概要
大切な人への感謝とお祝いする気持ちを「伝える」を応援したい。

このアプリは、記念日に特化したリマインダーです。

登録した相手の誕生日や結婚記念日が近づくとあなたのLINEへリマインド通知を送信してくれます（通知は、当日、前日、1週間前、2週間前に繰り返し送信）。

また、お祝いする相手へのプレゼントやレストランを探すまでの行動って、ついつい後回しになりがちではありせんか？

リマインド通知には相手へのプレゼントやレストラン等の選定の検索リンクも添付されているのでワンクリックで検索結果のページを表示してくれます。

些細な機能ですが、「まずは検索してみる」という行動を起こすまでのハードルを軽減させてくれます。

また、スマホにダウンロードする、記念日のリマインダー系アプリはたくさん見つかります。

しかし、スマホにアプリをダウンロードしても、アプリの更新ができていないとすぐに使えなかったり、アプリでスマホ容量を圧迫されるようなデメリットも回避できます。

# 制作背景(意図)
社会人として歳を重ねる毎に会社でお世話になっている人や友人、さらには結婚をすると婚約者含め相手方の親族等、大切な人の誕生日や記念日のイベント管理が増えてきました。

相手の誕生日などをメモすることはあっても、リマインダーを設定していないので気づかずに過ぎてしまい、結局相手にお祝いのメッセージを当日に伝えられないことが1度や2度ではありませんでした。

仮に気づく事ができても、プレゼントやレストラン等を当日や前日に探していたのでは間に合いません。

そこで、簡単に記念日を登録するだけでリマインドを受け取れたり、プレゼントやレストランのリサーチをするまでのアクションを促してくれる仕組みがあればと考え、制作に至りました。

# DEMO
※ 準備中
# 実装予定の内容
- ユーザー管理機能
- イベント（誕生日・記念日）管理機能
- LINEへの通知機能
- Docker導入（開発環境）
- AWS導入
# DB設計
[![Image from Gyazo](https://i.gyazo.com/c92726f4a839e9d2504c75acbac7a7da.png)](https://gyazo.com/c92726f4a839e9d2504c75acbac7a7da)
# Anniversary Reminder テーブル設計

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| name               | string     | null: false               |
| birth_date         | date       | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |

### Association

- has_many :events

## events テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| name               | string     | null: false               |
| gender_id          | integer    | null: false               |
| anniversary_date   | date       | null: false               |
| category_id        | integer    | null: false               |
| anniversary_name   | string     |                           |
| user               | references | foreign_key: true         |
### Association

- belongs_to :user
# アプリ名
Anniversary Reminder
# 概要(このアプリでできることを書いて下さい)
# 制作背景(意図)
# DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
# 実装予定の内容
# DB設計

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
|    | string     |                           |

### Association

- belongs_to :user
# テーブル設計

## usersテーブル

| colum              | Type     | Option      |
| ------             | -------- | ----------- | 
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| name               | string   | null: false |
| profile            | text     | null: false |
| occupation         | text     | null: false |
| position           | text     | null: false |

### Association

- has_many :prototypes
- has_many :comments

## prototypesテーブル

| colum              | Type        | Option      |
| ------             | --------    | ----------- | 
| title              | string      | null: false |
| catch_copy         | text        | null: false |  
| concept            | text        | null: false |
| user               | references  | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user

## commentsテーブル

| colum              | Type        | Option      |
| ------             | --------    | ----------- | 
| content            | text        | null: false |
| prototypes         | references  | null: false, foreign_key: true |
| user               | references  | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :comment
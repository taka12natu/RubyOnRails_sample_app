class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end

# t.stringは型の指定
# title bodyはカラム名の定義
# この後、ターミナルからrails db/migrateの実行でテーブルが作成される
class CreateComments < ActiveRecord::Migration[6.1]
  #迁移文件，用于创建对应的数据表
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end

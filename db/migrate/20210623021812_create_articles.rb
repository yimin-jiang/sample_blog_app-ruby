class CreateArticles < ActiveRecord::Migration[6.1]
  # Active Record 很智能，能自动把数据表的字段名映射到模型属性上，因此无需在 Rails 模型中声明属性，让 Active Record 自动完成即可。
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end

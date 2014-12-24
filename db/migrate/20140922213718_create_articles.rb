class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.text :intro
      t.text :text
      t.text :tech_used
      t.datetime :date_created
      t.datetime :date_published
      t.boolean :is_published

      t.timestamps
    end
  end
end

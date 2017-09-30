class AddPublishedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :publish, :boolean
  end
end

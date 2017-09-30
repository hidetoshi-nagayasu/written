class AddStarRateToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :star_rate, :integer
  end
end

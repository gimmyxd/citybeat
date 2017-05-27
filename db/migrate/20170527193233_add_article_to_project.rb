class AddArticleToProject < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :project, foreign_key: true
  end
end
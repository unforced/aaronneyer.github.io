class AddHomeBlogProjectsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_home, :boolean
    add_column :posts, :is_blog, :boolean
    add_column :posts, :is_project, :boolean
  end
end

class AddLikeDefaultToComment < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :likes, :integer, :default => 0
  end
end

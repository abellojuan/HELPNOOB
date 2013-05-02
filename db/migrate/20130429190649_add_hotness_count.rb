class AddHotnessCount < ActiveRecord::Migration
  def up
  	add_column :posts, :hotness_count, :integer, :default => 0
  	Post.find_each do |post|
      post.update_attribute(:hotness_count, post.hotness)
      post.save
    end
  end

  def down
  	remove :posts, :hotness_count
  end
end


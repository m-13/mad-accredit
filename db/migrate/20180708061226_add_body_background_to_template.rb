class AddBodyBackgroundToTemplate < ActiveRecord::Migration[5.2]
  def self.up
    add_column :templates, :body_bg_img, :binary, limit: 15.megabyte
  end

  def self.down
    remove_column :templates, :body_bg_image
  end
end

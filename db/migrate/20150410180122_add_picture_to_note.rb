class AddPictureToNote < ActiveRecord::Migration
  def change
    add_column :notes, :picture, :string
  end
end

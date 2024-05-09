class AddAvatartoEventstab < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :avatar, :string
  end
end

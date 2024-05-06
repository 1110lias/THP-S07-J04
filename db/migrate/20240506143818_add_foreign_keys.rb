class AddForeignKeys < ActiveRecord::Migration[7.1]
  def change
    add_reference: :attendance, :user, foreign_key:true
    add_reference: :attendance, :event, foreign_key:true
  end
end

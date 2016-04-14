class AddAvatarToCards < ActiveRecord::Migration
  def change
    add_attachment :cards, :avatar
  end
end

class AddGuestUserToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :guest_user, :boolean
  end
end

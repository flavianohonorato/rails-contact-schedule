class AddGroupToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :group_id, :integer
  end
end

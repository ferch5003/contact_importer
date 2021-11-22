class AddDeletedAtToFailedContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :failed_contacts, :deleted_at, :datetime
    add_index :failed_contacts, :deleted_at
  end
end

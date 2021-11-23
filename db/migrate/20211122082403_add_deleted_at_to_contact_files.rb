class AddDeletedAtToContactFiles < ActiveRecord::Migration[6.1]
  def change
    add_column :contact_files, :deleted_at, :datetime
    add_index :contact_files, :deleted_at
  end
end

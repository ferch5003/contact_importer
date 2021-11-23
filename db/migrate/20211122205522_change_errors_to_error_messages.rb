class ChangeErrorsToErrorMessages < ActiveRecord::Migration[6.1]
  def change
    rename_column :failed_contacts, :errors, :error_messages
  end
end

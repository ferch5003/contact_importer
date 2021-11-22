class CreateFailedContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :failed_contacts do |t|
      t.string :name
      t.string :date_of_birth
      t.string :telephone
      t.string :address
      t.string :credit_card
      t.string :franchise
      t.string :email
      t.string :card_last_digits
      t.text :errors
      t.references :user, null: false, foreign_key: true
      t.references :contact_file, null: false, foreign_key: true

      t.timestamps
    end
  end
end

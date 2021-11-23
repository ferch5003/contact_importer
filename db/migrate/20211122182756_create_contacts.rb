class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.date :date_of_birth
      t.string :telephone
      t.string :address
      t.string :credit_card
      t.string :franchise
      t.string :email
      t.string :card_last_digits
      t.references :user, null: false, foreign_key: true
      t.references :contact_file, null: false, foreign_key: true

      t.index %i[email user_id], unique: true

      t.timestamps
    end
  end
end

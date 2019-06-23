class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end

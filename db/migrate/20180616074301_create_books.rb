class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.references :format, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

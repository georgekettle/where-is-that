class CreateSaves < ActiveRecord::Migration[6.1]
  def change
    create_table :saves do |t|
      t.references :board, null: false, foreign_key: true
      t.references :pin, null: false, foreign_key: true

      t.timestamps
    end
  end
end

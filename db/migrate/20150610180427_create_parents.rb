class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.references :student, index: true, foreign_key: true
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :user_type

      t.timestamps null: false
    end
  end
end

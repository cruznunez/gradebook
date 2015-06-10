class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :teacher, index: true, foreign_key: true
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :user_type

      t.timestamps null: false
    end
  end
end

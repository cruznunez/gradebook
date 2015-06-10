class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.references :student, index: true, foreign_key: true
      t.float :value
      t.string :assignment_name

      t.timestamps null: false
    end
  end
end

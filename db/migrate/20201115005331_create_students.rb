class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :classNo
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

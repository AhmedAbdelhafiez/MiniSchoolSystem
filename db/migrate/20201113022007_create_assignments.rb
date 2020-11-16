class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :name
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.timestamps
    end
  end
end

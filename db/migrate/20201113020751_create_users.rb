class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :fullname
      t.date :dateOfBirth

      t.timestamps
    end
  end
end

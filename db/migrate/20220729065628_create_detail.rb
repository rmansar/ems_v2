class CreateDetail < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.string :name
      t.string :email
      t.string :dob
      t.string :father_name
      t.string :mother_name
      t.string :phone_number
      t.string :address
      t.string :experience
    end
  end
end

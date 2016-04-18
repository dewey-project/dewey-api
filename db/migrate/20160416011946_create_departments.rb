class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :school_id, null: false
      t.string  :title, null: false
      t.string  :abbreviation, null: false
      t.text    :description
      t.timestamps null: false
    end
  end
end

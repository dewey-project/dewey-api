class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
      t.integer :course_id, null: false
      t.integer :prerequisite_id, null: false
      t.timestamps null: false
    end
  end
end

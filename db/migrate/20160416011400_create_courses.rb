class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :school_id, null: false
      t.integer :department_id, null: false
      t.string  :title, null: false
      t.integer :code, null: false
      t.integer :credits, null: false
      t.timestamps null: false
    end
  end
end

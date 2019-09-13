class CreateStudentCourse < ActiveRecord::Migration[5.1]
  def change
    create_table :student_courses do |t|
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.float :grade, default: 3.0
    end
  end
end

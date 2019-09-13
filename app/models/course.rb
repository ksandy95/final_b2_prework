class Course < ApplicationRecord

  validates_presence_of :name

  has_many :student_courses
  has_many :students, through: :student_courses

  def list_by_grade
    Student.joins(:courses).where("course_id = ?", id).select("student_courses.grade", :name).order("student_courses.grade desc")
  end

end

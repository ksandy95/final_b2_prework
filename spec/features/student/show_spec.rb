require 'rails_helper'
RSpec.describe "Student Show Page" do
  describe "As a user" do
    before :each do
      @scott = Student.create(name: "Scott P")
      @nancy = Student.create(name: "Nancy")
      @alec = Student.create(name: "Alec")
      @tyler = Student.create(name: "Tyler")
      @kelly = Student.create(name: "Kelly")

      @computer_sci = Course.create(name: "Computers!")
      @butterfly = Course.create(name: "Butterfly Identification")
      @snack_time = Course.create(name: "Gold Fish Appreciation")

      @one = StudentCourse.create(student_id: @scott.id, course_id: @computer_sci.id, grade: 3.0)
      @two = StudentCourse.create(student_id: @nancy.id, course_id: @computer_sci.id, grade: 3.5)
      @three =StudentCourse.create(student_id: @alec.id, course_id: @computer_sci.id, grade: 4.0)
      @four = StudentCourse.create(student_id: @tyler.id, course_id: @computer_sci.id, grade: 4.0)
      @five = StudentCourse.create(student_id: @kelly.id, course_id: @computer_sci.id, grade: 3.5)

      @one_a = StudentCourse.create(student_id: @scott.id, course_id: @snack_time.id, grade: 3.0)
      @two_a = StudentCourse.create(student_id: @nancy.id, course_id: @snack_time.id, grade: 3.5)
      @three_a =StudentCourse.create(student_id: @alec.id, course_id: @snack_time.id, grade: 4.0)
      @four_a = StudentCourse.create(student_id: @tyler.id, course_id: @snack_time.id, grade: 4.0)
      @five_a = StudentCourse.create(student_id: @kelly.id, course_id: @snack_time.id, grade: 3.5)

      @one_b = StudentCourse.create(student_id: @scott.id, course_id: @butterfly.id, grade: 3.0)
      @two_b = StudentCourse.create(student_id: @nancy.id, course_id: @butterfly.id, grade: 3.5)
      @three_b =StudentCourse.create(student_id: @alec.id, course_id: @butterfly.id, grade: 4.0)
      @four_b = StudentCourse.create(student_id: @tyler.id, course_id: @butterfly.id, grade: 4.0)
      @five_b = StudentCourse.create(student_id: @kelly.id, course_id: @butterfly.id, grade: 3.5)
    end
    it "When I visit a student show page, I see: the student's
    name the name of each course the student is enrolled in,
    the student's grade for each course" do
      visit student_path(@scott)

      expect(page).to have_content(@scott.name)

      expect(page).to have_content(@one.grade)

      expect(page).to have_content(@one_a.grade)

      expect(page).to have_content(@one_b.grade)

      expect(page).to have_content(@computer_sci.name)
      expect(page).to have_content(@butterfly.name)
      expect(page).to have_content(@snack_time.name)
    end
  end
end

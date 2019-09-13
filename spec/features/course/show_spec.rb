require 'rails_helper'
RSpec.describe "Course Show Page" do
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

      @one = @scott.student_courses.create(course: @computer_sci, grade: 3.0)
      @two = @nancy.student_courses.create(course: @computer_sci, grade: 3.5)
      @three = @alec.student_courses.create(course: @computer_sci, grade: 4.0)
      @four = @tyler.student_courses.create(course: @computer_sci, grade: 4.0)
      @five = @kelly.student_courses.create(course: @computer_sci, grade: 3.5)

      @one_a = @scott.student_courses.create(course: @snack_time, grade: 3.5)
      @two_a = @nancy.student_courses.create(course: @snack_time, grade: 3.0)
      @three_a = @alec.student_courses.create(course: @snack_time, grade: 2.5)
      @four_a = @tyler.student_courses.create(course: @snack_time, grade: 3.0)
      @five_a = @kelly.student_courses.create(course: @snack_time, grade: 4.0)

      @one_b = @scott.student_courses.create(course: @butterfly, grade: 2.5)
      @two_b = @nancy.student_courses.create(course: @butterfly, grade: 4.0)
      @three_b = @alec.student_courses.create(course: @butterfly, grade: 3.5)
      @four_b = @tyler.student_courses.create(course: @butterfly, grade: 3.0)
      @five_b = @kelly.student_courses.create(course: @butterfly, grade: 4.0)
    end
    it "When I visit a course show page, the course's name, each student
    in the course listed in order from highest grade to lowest grade" do
      visit course_path(@snack_time)

      expect(page).to have_content(@snack_time.name)
      expect(page).to have_content(@one_a.grade)
      expect(page).to have_content(@two_a.grade)
      expect(page).to have_content(@three_a.grade)
      expect(page).to have_content(@four_a.grade)
      expect(page).to have_content(@five_a.grade)

    end
  end
end

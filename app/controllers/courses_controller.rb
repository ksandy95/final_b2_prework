class CoursesController < ApplicationController

  def show
    @course = Course.find(params[:id])
    @student = Student.new
  end

end

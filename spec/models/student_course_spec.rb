require 'rails_helper'

RSpec.describe StudentCourse do

  describe "relationships" do
    it {should belong_to :student}
    it {should belong_to :course}
  end
end

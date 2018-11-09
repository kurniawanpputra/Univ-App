class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  
  def enrollments
    
  end
end

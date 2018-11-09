class LoginsController < ApplicationController
  def new
    
  end
  
  def create
    student = Student.find_by(email: params[:logins][:email].downcase)
    if student && student.authenticate(params[:logins][:password])
      session[:student_id] = student.id
      flash[:notice] = "You have successfully logged in."
      redirect_to root_path
    else
      flash.now[:notice] = "Login information invalid."
      render 'new'
    end
  end
  
  def destroy
    session[:student_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end
end
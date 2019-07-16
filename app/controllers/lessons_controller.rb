class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]

  def show
    
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lession ||= Lesson.find(params[:id])
  end

#try to block user from accessing if they are not enrolled
  def require_authorized_for_current_lesson
    if !current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), alert: "You must be enrolled to view this lesson."
    end 
 end 

end
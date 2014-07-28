class ResponsesController < ApplicationController

  def create
    @response = Response.new
    @response.question_id = params[:question_id]
    @response.answer_choice_id =  params[:answer_choice_id]
    @response.user = current_user

  
    if @response.save
      redirect_to questions_url, :notice => "Successfully answered"
    else 
      render "questions/show"
      flash.now[:alert] = "Error responding to question"
    end
  end
end

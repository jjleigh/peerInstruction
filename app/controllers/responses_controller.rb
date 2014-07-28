class ResponsesController < ApplicationController

  def create
    @response = Response.new
    @response.question_id = params[:question_id]
    @response.answer_choice_id =  params[:answer_choice_id]
    @response.user = current_user

  
    if @response.save
      redirect_to questions_url, :notice => "Successfully answered"
    else 
      @question = Question.find(params[:question_id])
      flash.now[:alert] = @response.errors.full_messages.first
      render "questions/show"
      
    end
  end
end

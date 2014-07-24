class ResponsesController < ApplicationController

  def create
  	@answer_choice = AnswerChoice.find(params[:answer_choice_id])
  	@answer_choice.users<<current_user
  	if @answer_choice.save 
  		redirect_to questions_url, :notice => "Successfully answered"
  	else 
  		render 'questions/show'
      flash.now[:alert] = "Error responding to question"
  	end

  end

end

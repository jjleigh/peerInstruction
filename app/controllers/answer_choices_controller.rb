class AnswerChoicesController < ApplicationController
	def new
		@answer_choice = Answer_choice.new
	end

	def create
		@answer_choice = @question.answer_choices.build(answer_choices_params)
		@answer_choice.user_id = current_user.id
    # @answer_choice.users << current_user
		if @answer_choice.save
			redirect_to @answer_choice
		else
			render 'new'
		end
	end

	def edit
		@answer_choice = Answer_choice.find(params[:id])
	end

	def update
		@answer_choice = Answer_choice.find(params[:id])

		if @answer_choice.updated_attributes(answer_choices_params)
			redirect_to redirect_to question_answer_choice_path(@answer_choice)
		else 
			render 'edit'
		end 
	end

	def show
		@answer_choice = Answer_choice.find(params[:id])
		
	end

	def destroy
		@answer_choice = Answer_choice.find(params[:id])

		@answer_choice.destroy

		redirect_to edit_question_answer_choice_path(params[:question_id])
	end

	private

		def answer_choices_params
			params.require(:answer_choice).permit(:answer_choice)
		end
end

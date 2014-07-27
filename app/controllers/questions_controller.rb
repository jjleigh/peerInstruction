class QuestionsController < ApplicationController
before_filter :require_login, except: [:index, :show]
	
	def index
		@questions = Question.all
	end 
	def new
		@question = Question.new
	end

	def edit
		@question = Question.find(params[:id])
	end

#Could add a change state method and special route here; 

	def update
		@question = Question.find(params[:id])

		if @question.update_attributes(question_params)
			redirect_to questions_path
		else 
			render "edit"
		end 
	end

	def create
		@question = Question.new(question_params)

		if @question.save
			redirect_to questions_path
		else
			render 'new'
		end	
	end

	def show
		@question =Question.find(params[:id])
		
	end

	def destroy
		@question = Question.find(params[:id])

		@question.destroy
	end

	private
		def question_params
			params.require(:question).permit(:question, :is_open, answer_choices_attributes: [:answer_choice, :_destroy])
		end
end

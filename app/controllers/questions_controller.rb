class QuestionsController < ApplicationController
before_filter :ensure_logged_in, except: [:index, :show]
	
	def index
		@questions = Question.all
	end 
	def new
		@question = Question.new
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])

		if @question.update_attributes(question_params)
			redirect_to question_path(@question)
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

	def question_status
		@question = Question.find(params[:id])

		if @question.is_open == true
			#the question should be accessible to students for answering
		else 
		end
	end

	private
		def question_params
			params.require(:question).permit(:question, :is_open, answer_choices_attributes: [:answer_choice, :_destroy])
		end
end

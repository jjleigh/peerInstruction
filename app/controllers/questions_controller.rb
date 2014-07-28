class QuestionsController < ApplicationController
before_filter :ensure_logged_in, except: [:index, :show]
	
	def index
		@user = current_user
		@questions = @user.questions # This line of code only allows a current user to see their own questions
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
		@question.user_id = current_user.id # This line of code stores the user for the question as the current user


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
		redirect_to questions_path
	end

	private
		def question_params
			params.require(:question).permit(:description, :is_open, answer_choices_attributes: [:description, :_destroy])
		end
end

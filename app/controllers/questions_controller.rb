class QuestionsController < ApplicationController
before_filter :ensure_logged_in, except: [:my_questions, :show]
	
	# handles /users/5/questions
	# or /questions

	def index
		if params[:user_id]
			@user = User.find(params[:user_id])
			@questions = @user.questions
		else
			@questions = Question.where(:is_open => true)
		end

	end 

	# # /questions/my_question
	# def my_question
	# 	@user = current_user 
	# 	@my_questions = @user.questions # This line of code only allows a current user to see their own questions
	# end 

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
		if @question.is_open
			@question
		end
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

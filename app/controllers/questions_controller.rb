class QuestionsController < ApplicationController

before_filter :require_login, except: [:show]

	
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

#Could add a change state method and special route here; 

def update
	@question = Question.find(params[:id])

	respond_to do |format|
		if @question.update_attributes(question_params)
			format.html { redirect_to questions_path, notice: 'Question updated'} 
			format.js {}
		else
			format.html { render 'edit', alert: 'Error updating'}
			format.js {}
		end

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
			params.require(:question).permit(:description, :is_open, user_attributes: [:id], answer_choices_attributes: [:id, :description, :_destroy])
		end

end

class QuestionsController < ApplicationController

	def create
		@question = Question.create(question_params)
		if params[:publish]
			@question.status = "published"
			@question.save
			redirect_to dashboard_questions_path
		elsif params[:draft]
			@question.status = "draft"
			@question.save
			redirect_to dashboard_questions_path
		else
			redirect_to dashboard_path
		end
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to dashboard_questions_path
	end

	private

		def question_params
			params.require(:question).permit(:name, :answer, :status)
		end
end

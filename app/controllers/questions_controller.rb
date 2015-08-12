class QuestionsController < ApplicationController

	def create
		@question = Question.create(question_params)
		if params[:publish]
			@question.status = "published"
			if @question.save
				redirect_to(dashboard_questions_path, flash: :success)
			else
				redirect_to(dashboard_questions_path, flash: :error)
			end
		elsif params[:draft]
			@question.status = "draft"
			if @question.save
				redirect_to(dashboard_questions_path, flash: :success)
			else
				redirect_to(dashboard_questions_path, flash: :error)
			end
		end
	end

	def update
		@question = Question.find(params[:id])
		if params[:publish]
			@question.status = "published"
			if @question.update(question_params)
				redirect_to(dashboard_questions_path, flash: :success)
			else
				redirect_to(dashboard_questions_path, flash: :error)
			end
		elsif params[:draft]
			@question.status = "draft"
			if @question.update(question_params)
				redirect_to(dashboard_questions_path, flash: :success)
			else
				redirect_to(dashboard_questions_path, flash: :error)
			end
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

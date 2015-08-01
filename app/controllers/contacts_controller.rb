class ContactsController < ApplicationController

	def create
		@contact = Contact.new(contact_params)

		if params[:bio]
			if @contact.save
				ContactMailer.contact_email(@contact).deliver
				redirect_to bio_path
			else
				redirect_to bio_path
			end
		end

		if params[:ask]
			if @contact.save
				ContactMailer.question_email(@contact).deliver
				redirect_to faq_path
			else
				redirect_to faq_path
			end
		end

	end

	private

		def contact_params
			params.require(:contact).permit(:name, :email, :phone, :message)
		end

end

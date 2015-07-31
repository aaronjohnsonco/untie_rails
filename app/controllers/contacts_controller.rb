class ContactsController < ApplicationController

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to about_path
		end
	end

	private

		def contact_params
			params.require(:contact).permit(:name, :email, :phone, :message)
		end

end

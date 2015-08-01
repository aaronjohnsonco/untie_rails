class ContactMailer < ActionMailer::Base
  
  def contact_email(contact)
  	@contact = contact
  	mail(to: "aaronjohnsonis@gmail.com", subject: "New Contact", from: @contact.email)
	end

	def question_email(contact)
		@contact = contact
		mail(to: "aaronjohnsonis@gmail.com", subject: "New Question Asked", from: @contact.email)
	end

end

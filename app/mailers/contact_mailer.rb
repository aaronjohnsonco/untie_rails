class ContactMailer < ActionMailer::Base
  
  def contact_email(contact)
  	@contact = contact
  	emails = ['aaronjohnsonis@gmail.com', 'cchadwick@sbdlaw.net']
  	mail(to: emails, subject: "New Contact", from: @contact.email)
	end

	def question_email(contact)
		@contact = contact
		emails = ['aaronjohnsonis@gmail.com', 'cchadwick@sbdlaw.net']
		mail(to: emails, subject: "New Question Asked", from: @contact.email)
	end

end

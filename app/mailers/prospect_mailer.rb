class ProspectMailer < ActionMailer::Base

	def basic_divorce_email(prospect)
		@prospect = prospect
		emails = ['cchadwick@sbdlaw.net', 'Vcolvin@sbdlaw.net', 'aaron@bigmooncreative.com']
		mail(to: emails, subject: "Basic Divorce Prospect", from: @prospect.email)
	end

	def divorce_property_email(prospect)
		@prospect = prospect
		emails = ['cchadwick@sbdlaw.net', 'Vcolvin@sbdlaw.net', 'aaron@bigmooncreative.com']
		mail(to: emails, subject: "Divorce with Property Prospect", from: @prospect.email)
	end

	def divorce_children_email(prospect)
		@prospect = prospect
		emails = ['cchadwick@sbdlaw.net', 'Vcolvin@sbdlaw.net', 'aaron@bigmooncreative.com']
		mail(to: emails, subject: "Divorce with Children Prospect", from: @prospect.email)
	end

	def contested_divorce_email(prospect)
		@prospect = prospect
		emails = ['cchadwick@sbdlaw.net', 'Vcolvin@sbdlaw.net', 'aaron@bigmooncreative.com']
		mail(to: emails, subject: "Divorce with Children Prospect", from: @prospect.email)
	end

	def basic_divorce_client(prospect)
		@prospect = prospect
		mail(to: @prospect.email, subject: "Basic Divorce", from: "cchadwick@sbd.net")
	end

	def property_divorce_client(prospect)
		@prospect = prospect
		mail(to: @prospect.email, subject: "Divorce with Property", from: "cchadwick@sbd.net")
	end

	def children_divorce_client(prospect)
		@prospect = prospect
		mail(to: @prospect.email, subject: "Divorce with Children", from: "cchadwick@sbd.net")
	end


end

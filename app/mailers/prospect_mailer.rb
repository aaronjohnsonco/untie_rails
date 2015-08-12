class ProspectMailer < ActionMailer::Base

	def basic_divorce_email(prospect)
		@prospect = prospect
		mail(to: "cchadwick@sbdlaw.net", subject: "Basic Divorce Prospect", from: @prospect.email)
	end

	def divorce_property_email(prospect)
		@prospect = prospect
		mail(to: "cchadwick@sbdlaw.net", subject: "Divorce with Property Prospect", from: @prospect.email)
	end

	def divorce_children_email(prospect)
		@prospect = prospect
		mail(to: "cchadwick@sbdlaw.net", subject: "Divorce with Children Prospect", from: @prospect.email)
	end
	
end

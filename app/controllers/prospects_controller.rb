class ProspectsController < ApplicationController

	def create
		@prospect = Prospect.new(prospect_params)

		if params[:home1]
			if @prospect.save
				ProspectMailer.basic_divorce_email(@prospect).deliver
				redirect_to basic_divorce_path
			else
				redirect_to root_path
			end
		end

		if params[:home2]
			if @prospect.save
				ProspectMailer.divorce_property_email(@prospect).deliver
				redirect_to divorce_with_property_path
			else
				redirect_to root_path
			end
		end

		if params[:home3]
			if @prospect.save
				ProspectMailer.divorce_children_email(@prospect).deliver
				redirect_to divorce_with_children_path
			else
				redirect_to root_path
			end
		end

		if params[:about1]
			if @prospect.save
				ProspectMailer.basic_divorce_email(@prospect).deliver
				redirect_to basic_divorce_path
			else
				redirect_to about_path
			end
		end

		if params[:about2]
			if @prospect.save
				ProspectMailer.divorce_property_email(@prospect).deliver
				redirect_to divorce_with_property_path
			else
				redirect_to about_path
			end
		end

		if params[:about3]
			if @prospect.save
				ProspectMailer.divorce_children_email(@prospect).deliver
				redirect_to divorce_with_children_path
			else
				redirect_to about_path
			end
		end

	end

	def destroy
	end

	private

		def prospect_params
			params.require(:prospect).permit(:full_name, :date_of_marriage, :county_of_marriage, :street, :city, :state, :zip, :resided_how_long, :email, :phone, :number_of_children, :ages, :co_own_business, :co_own_property)
		end

end

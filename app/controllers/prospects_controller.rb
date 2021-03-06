class ProspectsController < ApplicationController

	def create
		@prospect = Prospect.new(prospect_params)

		if params[:home1]
			@prospect.option = "Basic Divorce"
			@prospect.status = "Pending"
			if @prospect.save
				ProspectMailer.basic_divorce_email(@prospect).deliver
				ProspectMailer.basic_divorce_client(@prospect).deliver
				redirect_to(basic_divorce_path, flash: :success)
			else
				redirect_to(root_path, flash: :error)
			end
		end

		if params[:home2]
			@prospect.status = "Pending"
			@prospect.option = "Divorce with Property"
			if @prospect.save
				ProspectMailer.divorce_property_email(@prospect).deliver
				ProspectMailer.property_divorce_client(@prospect).deliver
				redirect_to(divorce_with_property_path, flash: :success)
			else
				redirect_to(root_path, flash: :error)
			end
		end

		if params[:home3]
			@prospect.status = "Pending"
			@prospect.option = "Divorce with Children"
			if @prospect.save
				ProspectMailer.divorce_children_email(@prospect).deliver
				ProspectMailer.children_divorce_client(@prospect).deliver
				redirect_to(divorce_with_children_path, flash: :success)
			else
				redirect_to(root_path, flash: :error)
			end
		end

		if params[:contested]
			@prospect.status = "Pending"
			@prospect.option = "Contested Divorce"
			if @prospect.save
				ProspectMailer.contested_divorce_email(@prospect).deliver
				redirect_to(root_path, flash: :success)
			else
				redirect_to(root_path, flash: :error)
			end
		end

		if params[:about1]
			@prospect.status = "Pending"
			@prospect.option = "Basic Divorce"
			if @prospect.save
				ProspectMailer.basic_divorce_email(@prospect).deliver
				ProspectMailer.basic_divorce_client(@prospect).deliver
				redirect_to(basic_divorce_path, flash: :success)
			else
				redirect_to(about_path, flass: :error)
			end
		end

		if params[:about2]
			@prospect.status = "Pending"
			@prospect.option = "Divorce with Property"
			if @prospect.save
				ProspectMailer.divorce_property_email(@prospect).deliver
				ProspectMailer.property_divorce_client(@prospect).deliver
				rredirect_to(divorce_with_property_path, flash: :success)
			else
				redirect_to(about_path, flass: :error)
			end
		end

		if params[:about3]
			@prospect.status = "Pending"
			@prospect.option = "Divorce with Children"
			if @prospect.save
				ProspectMailer.divorce_children_email(@prospect).deliver
				ProspectMailer.children_divorce_client(@prospect).deliver
				redirect_to(divorce_with_children_path, flash: :success)
			else
				redirect_to(about_path, flass: :error)
			end
		end

	end

	def update
		@prospect = Prospect.find(params[:id])
	

  	respond_to do |format|
    	if @prospect.update_attributes(prospect_params)
      	format.html { redirect_to dashboard_prospects_path }
      	format.json { head :no_content } # 204 No Content
    	else
      	format.html { render action: "edit" }
      	format.json { render json: @post.errors, status: :unprocessable_entity }
    	end
  	end
	end

	def destroy
		@prospect = Prospect.find(params[:id])
		@prospect.destroy
		redirect_to dashboard_prospects_path
	end

	private

		def prospect_params
			params.require(:prospect).permit(:full_name, :full_name_spouse, :marriage_date, :county_of_marriage, :street, :city, :state, :zip, :resided_how_long, :email, :phone, :number_of_children, :ages, :co_own_business, :co_own_property, :option, :status)
		end

end

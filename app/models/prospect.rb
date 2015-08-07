class Prospect < ActiveRecord::Base

	include ActiveModel::Validations
  validates :full_name,
  					:date_of_marriage,
  					:county_of_marriage,
  					:street,
  					:city,
  					:state,
  					:zip,
  					:resided_how_long,
  					:email,
  					:phone,
  					:number_of_children,
  					:ages,
  					presence: true


end

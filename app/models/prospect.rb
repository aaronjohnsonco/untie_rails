class Prospect < ActiveRecord::Base

	include ActiveModel::Validations
  validates_presence_of :full_name
  validates_presence_of :marriage_date
  validates_presence_of :county_of_marriage
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  validates_presence_of :resided_how_long
  validates_presence_of :email
  validates_presence_of :phone

 


end

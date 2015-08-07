class Contact < ActiveRecord::Base

	include ActiveModel::Validations
  validates :name, :email, :phone, :message, presence: true

end

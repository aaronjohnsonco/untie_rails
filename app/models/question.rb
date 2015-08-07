class Question < ActiveRecord::Base

	include ActiveModel::Validations
  validates :name, :answer, presence: true

end

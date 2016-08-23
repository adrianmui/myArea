class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, length: { :minimum => 1}
  validates :last_name, length: { :minimum => 1}

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, numericality: true
end

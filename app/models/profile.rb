class Profile < ApplicationRecord
  belongs_to :user
  has_one :location, as: :locationable, class_name: "Location"

  validates :first_name, length: { :minimum => 1}
  validates :last_name, length: { :minimum => 1}

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, numericality: true

  def full_address
    "#{address}, #{zip}, #{city}, #{state}"
  end
end

class User < ApplicationRecord
  has_secure_password
  has_one :profile
  has_many :locations, as: :locationable, class_name: "Location"

  validates :username, length: { :minimum => 1}, uniqueness: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /@.*[.]com\z/
  #validates :password, :allow_nil => false#, length: { in: (5..26) }

  before_create :generate_token

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end

  # def has_profile?
  #   !!self.profile
  # end
  # helper_method :has_profile?
end

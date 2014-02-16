class Event < ActiveRecord::Base
  has_many :schedules
  has_many :members

  validates_uniqueness_of :access_token
  validates_uniqueness_of :admin_token
  validates_presence_of :access_token
  validates_presence_of :admin_token
  after_initialize :set_token

  private
  def set_token
    self.access_token = self.access_token.blank? ? generate_token(:access_token) : self.access_token
    self.admin_token = self.admin_token.blank? ? generate_token(:admin_token) : self.admin_token
  end

  def generate_token(token_key)
    tmp_token = SecureRandom.urlsafe_base64(10)
    self.class.where(token_key => tmp_token).blank? ? tmp_token : generate_token
  end
end

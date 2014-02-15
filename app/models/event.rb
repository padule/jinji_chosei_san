class Event < ActiveRecord::Base
  has_many :schedules
  has_many :members

  validates_uniqueness_of :access_token
  validates_presence_of :access_token
  after_initialize :set_access_token

  private
  def set_access_token
    self.access_token = self.access_token.blank? ? generate_access_token : self.access_token
  end

  def generate_access_token
    tmp_token = SecureRandom.urlsafe_base64(10)
    self.class.where(:access_token => tmp_token).blank? ? tmp_token : generate_access_token
  end
end

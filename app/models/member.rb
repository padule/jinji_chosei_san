class Member < ActiveRecord::Base
  belongs_to :event
  has_many :member_schedules

  accepts_nested_attributes_for :member_schedules

  validates_uniqueness_of :access_token
  validates_presence_of :access_token
  after_initialize :set_token

  private
  def set_token
    self.access_token = self.access_token.blank? ? generate_token(:access_token) : self.access_token
  end

  def generate_token(token_key)
    tmp_token = SecureRandom.urlsafe_base64(10)
    self.class.where(token_key => tmp_token).blank? ? tmp_token : generate_token
  end
end

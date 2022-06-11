class Url < ApplicationRecord
  before_create :set_token

  validates :original_url, presence: true
  validates :original_url, format: { with: URI.regexp }, if: :original_url

  validates :token, uniqueness: { case_sensitive: true }

  private

  def set_token
    begin
      self.token = SecureRandom.urlsafe_base64(6)
    end while self.class.exists?(token: token) 
  end
end

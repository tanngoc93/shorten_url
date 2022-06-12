class Url < ApplicationRecord
  validates :original_url, presence: true
  validates :original_url, format: { with: URI.regexp }, if: :original_url
  validates :token, uniqueness: { case_sensitive: true }

  before_create :set_token

  private

  def set_token
    begin
      self.token = SecureRandom.base58(6)
    end while self.class.exists?(token: token) 
  end
end

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  has_many :relationships, foreign_key: "rater_id", dependent: :destroy
  has_many :targets, through: :relationships, source: :target
  has_many :reverse_relationships, foreign_key: "target_id",
                                   class_name: "Relationship",
                                   dependent: :destroy
  has_many :raters, through: :reverse_relationships, source: :rater

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def targeting?(other_user)
    relationships.find_by_target_id(other_user.id)
  end

  def target!(other_user)
    relationships.create!(target_id: other_user.id)
  end

  def requested?(other_user)
    relationships.find_by_rater_id(other_user.id)
  end

  def request!(other_user)
    relationships.create!(rater_id: other_user.id)
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

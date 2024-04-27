class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable # Add this if it's missing
  validates :name, allow_nil: true, length: { minimum: 2, maximum: 100 }

  validate :name_valid

  private

  def name_valid
    errors.add(:name, :invalid) unless name =~ /\A[a-zA-Z\s]+\z/
  end
end

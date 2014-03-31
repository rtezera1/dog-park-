class Dogowner < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: {with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }

  has_many :dogs, foreign_key: 'owner_id', class_name: 'Dog'

  def fullname
    "#{first_name} #{last_name}"
  end
end

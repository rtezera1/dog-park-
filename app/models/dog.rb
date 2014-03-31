class Dog < ActiveRecord::Base
  validates :owner, presence: true
  validates :dog_name, presence: true

  belongs_to :owner, foreign_key: 'owner_id', class_name: 'Dogowner'


end

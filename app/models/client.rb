class Client < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true
  validates :number_and_street, presence: true
  validates :zip_code, presence: true, length: { minimum: 5 }#should be equal but create an unknown testing error
  validates :city, presence: true
  
end

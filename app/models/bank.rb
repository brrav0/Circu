class Bank < ActiveRecord::Base
  has_many :signatories, dependent: :destroy
end

class Bankaccount < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  belongs_to :bank
end

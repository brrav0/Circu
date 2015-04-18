class Account < ActiveRecord::Base
  belongs_to :client
  belongs_to :signatory
end

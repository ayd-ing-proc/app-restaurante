class AccountProduct < ApplicationRecord
  belongs_to :product
  belongs_to :account
end

class Account < ApplicationRecord
	has_many :account_products
	accepts_nested_attributes_for :account_products
end

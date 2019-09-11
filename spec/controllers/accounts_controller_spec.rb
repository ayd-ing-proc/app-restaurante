require 'rails_helper'
describe AccountsController do
	let(:product) { create(:product) }
	let(:product2) { create(:product, name: "Chuleta", price: 22000) }
	let(:product3) { create(:product, name: "Bandeja Paisa", price: 21500) }

	it "Creates successfully an account" do
		options = {
			account: {
				account_products_attributes: {
					"0" => { product_id: product.id, quantity: 0 },
					"1" => { product_id: product2.id, quantity: 1 },
					"2" => { product_id: product3.id, quantity: 2 },
				}
				
			}
		}
		
		expect { post :create, params: options }.to change { Account.count }.by(1)
	end

	it "Rejects empty quantity products" do
		options = {
			account: {
				account_products_attributes: {
					"0" => { product_id: product.id, quantity: 0 },
					"1" => { product_id: product2.id, quantity: 0 },
					"2" => { product_id: product3.id, quantity: 0 },
				}
				
			}
		}
		
		expect { post :create, params: options }.to change { Account.count }.by(0)
	end
end

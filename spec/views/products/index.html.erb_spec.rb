require "rails_helper"

RSpec.describe "Renders the product list" do
  let(:product) { create(:product) }
  let(:product2) { create(:product, name: "Chuleta", price: 22000) }
  let(:product3) { create(:product, name: "Bandeja Paisa", price: 21500) }

  it "displays the products" do
    assign(:products, [product, product2, product3])

    render :template => "products/index.html.erb"

    expect(rendered).to match product.name
    expect(rendered).to match /Chuleta/
    expect(rendered).to match /Bandeja Paisa/
  end
end


require "rails_helper"

RSpec.describe "User navigates in product catalog", type: :system do
  before do
    @products = [create(:product), create(:product, name: "Chuleta", price: 22000), create(:product, name: "Bandeja Paisa", price: 21500)
    ]
  end

  it "Shows products and link to new account" do
    visit "/"
    @products.each do |product|
      expect(page).to have_content(product.name)
    end

    click_link("Nuevo pedido")

    expect(page).to have_content("Nuevo pedido")
  end

  it "Shows form and sends account creation" do
    visit "/pedido/new"

    @products.each do |product|
      expect(page).to have_content(product.name)
    end

    fill_in "account[account_products_attributes][0][quantity]", with: 1
    click_button "Enviar"

    expect(page).to have_content("Pedido realizado")
  end
end
class ProductsController < ApplicationController
	layout "application"
	def index
		@products = Product.all
	end
end
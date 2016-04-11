class ItemsController < ApplicationController
	before_action :find_item, only: [:show, :edit, :update, :destroy ] 
	before_action :authenticate_user!, except: [:index, :show, :sort_directions]

	def index
		@items = Item.all.order("name ASC")
	end

	def show		
	end

	def new
		@item=Item.new
	end

	def create
		@item=Item.new(item_params)

		if @item.save 
			redirect_to @item, notice: "Succesfully created new item"
		else
			render 'new'
		end
	end

	def edit

	end


	def update
		if @item.update(item_params)
			redirect_to @item
		else
			render 'edit'
		end
	end

	def destroy
		@item.destroy
		redirect_to root_path, notice: "Succesfully deleted item"
	end

	private 

	def item_params
		params.require(:item).permit(:name, :quantity, :unit_type, :unit, :price_per_unit, :min_quantity, :min_unit) 
	end

	def find_item
		@item = Item.find(params[:id])
	end

end


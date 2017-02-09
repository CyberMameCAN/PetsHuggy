class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, onlu: [:basics, :description, :address, :price, :photos, :bankaccount, :publish]
  
  def index
  end

  def show
  end

  def new
	  # 現在のユーザーのリスティングの作成
	  @listing = current_user.listings.build
  end

  def create
	  # パラメーターとともに現在のユーザーのリスティングを作成
	  @listing = current_user.listings.build(listing_params)
	  
	  if @listing.save
		  redirect_to manage_listing_basics_path(@listing), notice: "リスティングを作成・保存をしました"
		else
		  redirect_to new_listing_path, notice: "リスティングを保存できませんでした"
		end
  end

  def edit
  end

  def update
  end
  
  def basics
	end
	
	def description
	end
		
  def address
	end
	
  def price
	end
	
  def photos
	end
	
  def calendar
	end
	
  def bankaccount
	end
	
  def publish
	end
	
  private
  
  def listing_params
	  params.require(:listing).permit(:home_type, :pet_type, :breeding_years, :pet_size)
	end
	
	def set_listing
	  @listing = Listing.find(params[:id])
	end
end

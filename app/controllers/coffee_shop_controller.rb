# frozen_string_literal: true

class CoffeeShopController < ApplicationController
  def show
    @coffee_shop = CoffeeShop.find(params[:yelp_id])
    @is_favorite = current_user&.find_favorite(@coffee_shop) || false
  end

  def favorite
    yelp_id = params[:format]
    result = Yelp::Fetch.call(yelp_id: yelp_id).result

    if result
      coffee_shop = CoffeeShop.find_or_create_by(
        name: result.name,
        coordinates: result.coordinates,
        location: result.location,
        image_url: result.image_url.to_s,
        rating: result.rating,
        transaction_types: result.transaction_types,
        phone: result.phone,
        url: result.url,
        search_phrase: result.search_phrase,
        yelp_id: result.yelp_id,
        open: result.is_open?,
        price: result.price,
        hours: result.hours
      )
    end

    if coffee_shop && current_user
      current_user.coffee_shops << coffee_shop

      flash[:notice] = "#{coffee_shop.name} has been added to your favorite Coffee Shops!"
    else
      flash[:notice] = 'An error occurred, please try again'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    yelp_id = params[:format]

    if user
      response = DestroyService.destroy_favorite(user.dig(:data, :id), yelp_id)
      user = {
        type: :user,
        event: :destroy,
        id: user.dig(:data, :id),
        email: user.dig(:data, :attributes, :email),
        coffee_shop: {
          yelp_id: yelp_id
        }
      }
      LogCreateJob.perform_later(user)
      flash[:notice] = if response == 'success'
                         'Favorite has been removed!'
                       else
                         'An error occurred, please try again'
                       end
    else
      flash[:notice] = 'An error occurred, please try again'
    end
    redirect_back(fallback_location: root_path)
  end
end

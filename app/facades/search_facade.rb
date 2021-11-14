class SearchFacade
  class << self

    def route(params, location)
      case
      when params[:query]
        begin
          YelpService.search(params)
        rescue
          unexpected_error
        end
      when params[:sort_by]
        begin
          CoffeeShop.filter_by_rating(location)
        rescue
          unexpected_error
        end
      end
    end

    def unexpected_error
      raise "An error has occurred"
    end

  end
end

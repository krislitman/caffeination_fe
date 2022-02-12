class SearchFacade
  class << self

    def route(params, location)
      begin
        case
        when params[:query]
          YelpService.search(params)
        when params[:sort_by]
          sort_options(params)
        end
      rescue
        unexpected_error
      end
    end

    def sort_options(params)
      begin
        sort_type = params[:sort_by]
        case
        when sort_type == "No Starbucks"
          CoffeeShop.filter_by_starbucks(location)
        when sort_type == "Rating"
            CoffeeShop.filter_by_rating(location)
        end
      rescue
        unexpected_error
      end
    end

    private

    def unexpected_error
      raise "An error has occurred"
    end
  end
end

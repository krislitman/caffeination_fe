# frozen_string_literal: true

module CarouselHelper
	def carousel_for(shops)
		Carousel.new(self, shops).html
	end

	class Carousel
		def initialize(view, shops)
			@view, @shops = view, shops
		end

		def html
			content = view.safe_join([indicators, slides, controls])
			view.content_tag(:div, content, class: 'carousel slide')
		end

		private

		attr_accessor :view, :shops
		delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

		def indicators
		end

		def slides
		end

		def controls
		end
	end
end

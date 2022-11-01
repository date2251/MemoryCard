module Api
  module V1
    class CardsController < ApiController
      def index
        cards = Card.all
        render json: cards
      end
    end
  end
end

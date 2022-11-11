module Api
  module V1
    class CardsController < ApiController
      def index
        cards = Card.all
        render json: CardSerializer.new(cards).serializable_hash
      end
    end
  end
end

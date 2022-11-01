module Api
  module V1
    class RankingsController < ApiController
      # NotFound時404エラー
      rescue_from ActiveRecord::RecordNotFound do |_exception|
        render json: { error: '404 not found' }, status: 404
      end

      def index
        rankings = Ranking.select(:user_name, :try_num).distinct.order(try_num: :asc)
        render json: rankings
      end

      def create
        rank = Ranking.new(rank_params)
        if rank.save
          render json: rank, status: :created
        else
          render json: { errors: rank.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def rank_params
        params.fetch(:ranking, {}).permit(:user_name, :try_num)
      end
    end
  end
end

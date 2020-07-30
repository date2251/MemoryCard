class Api::V1::RankingsController < ApiController
	# NotFound時404エラー
	rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

	def index
		rankings = Ranking.select(:username, :trynum).distinct.order(trynum: :asc)
		render json: rankings
	end

	def create
		rank = Ranking.new(rank_params)
		if rank.save
			render 	json: rank, status: :created
		else
			render json: { errors: rank.errors.full_messages }, status: :unprocessable_entity
		end
	end

	private

		def rank_params
			params.fetch(:ranking, {}).permit(:username, :trynum)
		end
end

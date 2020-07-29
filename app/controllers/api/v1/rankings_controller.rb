class Api::V1::RankingsController < ApiController
	# NotFound時404エラー
	rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

	def index
		rankings = Ranking.select(:username, :trynum).distinct.order(trynum: :asc)
		render json: rankings
	end
end

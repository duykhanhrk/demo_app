class App::Api::AisController < ApplicationController
  def index
    ais = Ai.all
    render json: ais, status: :ok
  end

  def create
    ai = Ai.create!(ai_params)

    render json: ai, status: :ok
  end

  private

  def ai_params
    params.require(:ai)
          .permit :name,
                  :weight,
                  :factory_date
  end
end

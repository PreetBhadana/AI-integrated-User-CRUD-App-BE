class Api::V1::ChatController < ApplicationController
  def ask
    prompt = params[:prompt]
    if prompt.blank?
      render json: { error: "Prompt is required" }, status: :bad_request
      return
    end

    response = OpenaiService.ask(prompt)
    render json: { response: response }
  end
end
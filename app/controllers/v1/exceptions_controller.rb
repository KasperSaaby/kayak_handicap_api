class V1::ExceptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |e| render text: e.message, status: :not_found end
  rescue_from ActiveRecord::RecordInvalid do |e| render text: e.message, status: :unprocessable_entity end
end
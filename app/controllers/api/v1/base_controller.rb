class Api::V1::BaseController < Api::V1::ExceptionsController
  def current_club
    #@current_club ||= Authentication
  end
end

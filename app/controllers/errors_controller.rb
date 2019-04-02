class ErrorsController < ApplicationController
  def routing_error
    raise ActionController::RoutingError, "URLが間違ってるよ！ #{request.path.inspect}"
  end
  
  def error
  end
end
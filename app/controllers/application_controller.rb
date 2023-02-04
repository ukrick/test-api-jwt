class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :null_session, if: proc { |c| c.request.format =~ %r{application/json} }

  respond_to :json
end

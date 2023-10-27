class ApplicationController < ActionController::Base
  before_action :cors_set_access_control_headers

  # This method will set the access control header accordingly after each action performed.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'Date, Content-Disposition'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Access-Token, slug, locale, authorization, pincode'
    headers['Access-Control-Max-Age'] = '1728000'
  end
end

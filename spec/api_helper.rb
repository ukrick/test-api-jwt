# frozen_string_literal: true

require 'devise/jwt/test_helpers'

module ApiHelper
  def authenticated_header(request, user)
    auth_headers = Devise::JWT::TestHelpers.auth_headers({}, user)
    request.headers.merge!(auth_headers)
  end
end

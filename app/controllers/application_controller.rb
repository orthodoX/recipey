class ApplicationController < ActionController::Base
  rescue_from Content::Errors::NotFound, Contentful::NotFound, with: :not_found
  rescue_from Contentful::Unauthorized, with: :server_error

  def not_found
    render file: Rails.root.join("public/404.html"), status: :not_found
  end

  def server_error
    render file: Rails.root.join("public/500.html"), status: :internal_server_error
  end
end

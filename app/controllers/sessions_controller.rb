class SessionsController < Clearance::SessionsController

  def url_after_destroy
    Clearance.configuration.redirect_url
  end

end
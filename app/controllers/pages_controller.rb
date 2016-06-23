class PagesController < ApplicationController
  def home
  end

  def admin
    admins_only
  end
end

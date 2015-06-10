class PagesController < ApplicationController
  include ApplicationHelper
  before_action :logged_in?

  def home
  end
end

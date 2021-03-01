class UsersController < ApplicationController

  before_action :require_logged_in, only: [:index]
  
end

class WelcomeController < ApplicationController
  before_action { authorize_for(nil) }

  def index
  end
end

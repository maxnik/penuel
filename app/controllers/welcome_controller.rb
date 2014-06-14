class WelcomeController < ApplicationController
  before_action { authorize_for }

  def index
  end
end

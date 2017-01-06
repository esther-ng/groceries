class StoresController < ApplicationController

  def index
    render json: Store.all
  end
end

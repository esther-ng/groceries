class StoresController < ApplicationController

  def search
    render json: Store.search(params[:query])
  end
end

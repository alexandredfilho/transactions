class StoresController < ApplicationController

  def index
    @stores = Store.all.order('created_at DESC')
  end
end
class StoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @stores = Store.all.order('created_at DESC')
  end
end
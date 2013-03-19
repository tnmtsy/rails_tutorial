class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_cart_id

  def set_cart_id
    @cart_id = current_cart.id
  end

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    cart.save
    session[:cart_id] = cart.id
    cart
  end
end

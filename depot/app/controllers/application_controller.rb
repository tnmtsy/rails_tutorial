# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_cart_id, :authorize

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

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: 'ログインしてください'
    end
  end
end

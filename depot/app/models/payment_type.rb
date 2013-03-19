# encoding: utf-8

class PaymentType < ActiveRecord::Base
  attr_accessible :name

  def self.names
    names = PaymentType.all.collect { |payment_type| payment_type.name }
    if names.empty?
      names = ["check", "credit card", "purchase"]
    end
    return names
  end
end

class CopyProductPriceToLineItems < ActiveRecord::Migration
  def up
    LineItem.all.each do |line_items|
      product = Product.find_by_id(line_items.product_id)
      line_items.price = product.price
      line_items.save()
    end
  end

  def down
  end
end

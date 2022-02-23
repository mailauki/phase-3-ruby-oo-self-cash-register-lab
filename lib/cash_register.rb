require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :items_info, :last_transaction
  attr_reader :title, :price, :quantity

  def initialize(discount = nil)
    @total = 0.0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    # new_item_info = {title:title, price:price, quantity:quantity}
    # self.items_info = [@items_info, new_item_info].flatten.filter { |item| item != nil }
    # new_item = quantity > 1 ? ("#{title} " * quantity).split(" ") : title
    # self.items = [@items, new_item].flatten.filter { |item| item != nil }
    # self.total += (price * quantity)
    self.last_transaction = price * quantity
    self.total += self.last_transaction
    quantity.times do
      self.items << title
    end
  end

  def apply_discount
    if self.discount
      discount_as_percent = (100.0 - self.discount.to_f) / 100
      self.total = (self.total * discount_as_percent).to_i
      "After the discount, the total comes to $#{self.total}."
    else 
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    # self.total -= @items_info[-1][:price]
    # @items_info.pop
    # @items.pop
    # self.total
    self.total -= self.last_transaction
  end

end

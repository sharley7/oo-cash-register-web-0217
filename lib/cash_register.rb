class CashRegister

attr_accessor :total, :items, :last_item_price, :employee_discount, :quantity, :last_item


  def initialize (employee_discount=0)
    total = 0
    @total = total
    @employee_discount = employee_discount
    @items = []
  end

  def discount
    @employee_discount
  end

  def add_item (item, price, quantity = 1)
    @total += price * quantity
    @last_item_price = price
    @last_item = item
    quantity.times do 
    @items << item
  end
  end

  def apply_discount
    if @employee_discount > 0
      self.total -= (total * employee_discount/100)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= @last_item_price
    @items.delete_if {|item| item == @last_item}
  end

end

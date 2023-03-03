require_relative 'items'

class ItemsRepository
  def all
    items = []

    sql = 'SELECT id, item_name, price, quantity FROM items;'
    result_set = DatabaseConnection.exec_params(sql,[])

    result_set.each do |record|
      item = Items.new

      item.id = record['id']
      item.item_name = record['item_name']
      item.price = record['price']
      item.quantity = record['quantity']

      items << item
    end
    return items
  end

end
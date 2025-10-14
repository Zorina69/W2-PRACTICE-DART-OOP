enum DeliveryType { pickup, delivery }

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class OrderItem {
  final Product product;
  final int quantity;

  OrderItem(this.product, this.quantity);

  double getItemTotal() => product.price * quantity;
}

class Order {
  final List<OrderItem> items;
  final DeliveryType deliveryType;
  final String? address;

  Order({
    required this.items,
    required this.deliveryType,
    this.address,
  });

  double getTotalAmount() {
    double total = 0;
    for (var item in items) {
      total += item.getItemTotal();
    }
    // Optional: Add delivery fee
    if (deliveryType == DeliveryType.delivery) {
      total += 5.0;
    }
    return total;
  }
}

class Customer {
  final String name;
  final String email;
  final List<Order> orders = [];

  Customer(this.name, this.email);

  void addOrder(Order order) {
    orders.add(order);
  }
}

void main() {
  // Sample products
  var p1 = Product("Laptop", 1200.0);
  var p2 = Product("Mouse", 25.0);

  // Sample order items
  var item1 = OrderItem(p1, 1);
  var item2 = OrderItem(p2, 2);

  // Order example
  var order = Order(
    items: [item1, item2],
    deliveryType: DeliveryType.delivery,
    address: "123 Main Street",
  );

  // Customer
  var customer = Customer("Alice", "alice@email.com");
  customer.addOrder(order);

  // Output
  print("Customer: ${customer.name}");
  print("Order total: \$${order.getTotalAmount()}");
}

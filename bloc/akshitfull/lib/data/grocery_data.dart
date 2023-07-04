class GroceryProduct {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  GroceryProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class GraceryData {
  static List<GroceryProduct> sampleProducts = [
    GroceryProduct(
      id: 1,
      name: "Apples",
      description: "Fresh and juicy apples",
      price: 1.99,
      imageUrl: "https://ekissaan.com/wp-content/uploads/2022/10/apple_158989157.jpeg",
    ),
    GroceryProduct(
      id: 2,
      name: "Bananas",
      description: "Ripe and delicious bananas",
      price: 0.99,
      imageUrl: "https://target.scene7.com/is/image/Target/GUEST_f5d0cfc3-9d02-4ee0-a6c6-ed5dc09971d1?wid=488&hei=488&fmt=pjpeg",
    ),
    GroceryProduct(
      id: 3,
      name: "Bread",
      description: "Freshly baked bread",
      price: 2.49,
      imageUrl: "https://www.thespruceeats.com/thmb/vbc6MqkqHlkSOx_X5Clyo5qv0kk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/loaf-of-bread-182835505-58a7008c5f9b58a3c91c9a14.jpg",
    ),
    GroceryProduct(
    id: 4,
    name: "Milk",
    description: "Fresh cow's milk",
    price: 3.99,
    imageUrl: "https://cdn.britannica.com/77/200377-050-4326767F.jpg",
  ),
  ];
}

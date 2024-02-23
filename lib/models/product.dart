class Product {
  final String name;
  final String shopName;
  final String imageUrl;
  final String price;
  final String description;
  final String? category;

  Product({
    required this.name,
    required this.shopName,
    required this.imageUrl,
    required this.price,
    required this.description,
    this.category,
  });
}

List<Product> getDummyProducts() {
  return [
    Product(
      name: 'Camera',
      shopName: 'TakeShop',
      imageUrl:
          'https://th.bing.com/th/id/R.535a98489ad47af0ba516be77df51f11?rik=r294h8QD7KGBDQ&riu=http%3a%2f%2fallthingsd.com%2ffiles%2f2013%2f01%2fX100S_FRONT_L_R.jpg&ehk=6uvOK%2f5z%2fFWFl7F%2fJ3CoBjQ7%2fRgYPvAOXR1STT4S4dc%3d&risl=&pid=ImgRaw&r=0',
      price: '7500000',
      description: '50 items remaining',
      category: "camera",
    ),
    Product(
      name: 'Flower Bouquet',
      shopName: 'Florist',
      imageUrl:
          'https://th.bing.com/th/id/OIP.7S98ioyS2MNDJwPwSCkbMwHaHa?rs=1&pid=ImgDetMain',
      price: '150000',
      description: '50 items remaining',
      category: "event",
    ),
    Product(
      name: 'Piknik Set',
      shopName: 'CeriaShop',
      imageUrl:
          'https://down-id.img.susercontent.com/file/d8ce825ea0b8b2c33592973dfad52785',
      price: '1000000',
      description: '50 items remaining',
      category: "camping",
    ),
    Product(
      name: 'Kostum',
      shopName: 'H en Em',
      imageUrl:
          'https://th.bing.com/th/id/OIP.WoDopXZV8HiMssh2pv-0ZgHaMO?rs=1&pid=ImgDetMain',
      price: '1000000',
      description: '50 items remaining',
      category: "custom",
    ),
    // Add more products as needed
  ];
}

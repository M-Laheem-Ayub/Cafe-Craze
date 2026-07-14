List<Map<String, dynamic>> cartItems = [
  {
    "id": 1,
    "title": "Cappuccino",
    "subtitle": "With Steamed Milk",
    "image": "assets/images/coffee1.png",
    "roast": "Medium Roasted",
    "prices": [
      {"size": "S", "price": 4.20, "quantity": 1},
      {"size": "M", "price": 4.20, "quantity": 1},
      {"size": "L", "price": 4.20, "quantity": 1},
    ],
  },
  {
    "id": 2,
    "title": "Cappuccino",
    "subtitle": "With Steamed Milk",
    "image": "assets/images/coffee2.png", // Assuming same image for demo
    "roast": "Medium Roasted",
    "single_price_row": true, // To match the 2nd item style in image
    "size": "M",
    "price": 6.20,
    "quantity": 1,
  },
  {
    "id": 3,
    "title": "Robusta Beans",
    "subtitle": "From Africa",
    "image": "assets/images/beans1.png",
    "roast": "Medium Roasted",
    "single_price_row": true,
    "size": "250gm",
    "price": 6.20,
    "quantity": 1,
  },
  {
    "id": 4,
    "title": "Liberica Coffee Beans",
    "subtitle": "With Steamed Milk",
    "image": "assets/images/beans2.png",
    "roast": "Medium Roasted",
    "prices": [
      {"size": "250gm", "price": 4.20, "quantity": 1},
      {"size": "500gm", "price": 4.20, "quantity": 1},
      {"size": "1Kg", "price": 4.20, "quantity": 1},
    ],
  },
];

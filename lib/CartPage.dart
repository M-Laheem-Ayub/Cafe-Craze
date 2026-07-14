import 'package:cafe_craze/MyText.dart';
import 'package:cafe_craze/data/cart_data.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      if (item['prices'] != null) {
        for (var priceRow in item['prices']) {
          total +=
              (priceRow['price'] as double) * (priceRow['quantity'] as int);
        }
      } else {
        total += (item['price'] as double) * (item['quantity'] as int);
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0c0f14),
        body: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xff141921),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.grid_view_rounded,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                  MyText(text: "Cart", size: 24, fWeight: FontWeight.bold),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/profile_img.png",
                        ), // Placeholder
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Cart Items List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemCard(
                    item: cartItems[index],
                    onQuantityChanged: () {
                      setState(() {});
                    },
                  );
                },
              ),
            ),

            // Bottom Total & Pay
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(text: "Total Price", size: 14, color: Colors.grey),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "\$ ",
                              style: TextStyle(
                                color: Color(0xffD17842),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: calculateTotal().toStringAsFixed(2),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 240,
                    decoration: BoxDecoration(
                      color: const Color(0xffD17842),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: MyText(
                        text: "Pay",
                        size: 20,
                        fWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemCard extends StatefulWidget {
  final Map<String, dynamic> item;
  final VoidCallback onQuantityChanged;
  const CartItemCard({
    super.key,
    required this.item,
    required this.onQuantityChanged,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff141921), // Dark grey card background
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  widget.item['image'],
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: widget.item['title'],
                      size: 18,
                      fWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      text: widget.item['subtitle'],
                      size: 12,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff0c0f14),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MyText(
                        text: widget.item['roast'],
                        size: 12,
                        color: Colors.grey[400]!,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          // Price Rows
          if (widget.item['prices'] != null)
            ...List.generate((widget.item['prices'] as List).length, (index) {
              var priceRow = (widget.item['prices'] as List)[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: _buildPriceRow(
                  priceRow['size'],
                  priceRow['price'],
                  priceRow['quantity'],
                  (val) {
                    setState(() {
                      priceRow['quantity'] = val;
                      widget.onQuantityChanged();
                    });
                  },
                ),
              );
            })
          else
            _buildPriceRow(
              widget.item['size'],
              widget.item['price'],
              widget.item['quantity'],
              (val) {
                setState(() {
                  widget.item['quantity'] = val;
                  widget.onQuantityChanged();
                });
              },
            ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    String size,
    double price,
    int quantity,
    Function(int) onQtyChanged,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Size Label
        Container(
          width: 60,
          height: 35,
          decoration: BoxDecoration(
            color: const Color(0xff0c0f14),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: MyText(text: size, size: 14, fWeight: FontWeight.bold),
          ),
        ),

        // Price
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "\$ ",
                style: TextStyle(
                  color: Color(0xffD17842),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: price.toStringAsFixed(2),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // Counter
        Row(
          children: [
            _buildCounterButton(Icons.remove, () {
              if (quantity > 0) onQtyChanged(quantity - 1);
            }),
            const SizedBox(width: 10),
            Container(
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffD17842)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: MyText(
                text: "$quantity",
                size: 14,
                fWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            _buildCounterButton(Icons.add, () {
              onQtyChanged(quantity + 1);
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xffD17842),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}

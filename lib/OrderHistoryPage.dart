import 'package:cafe_craze/MyText.dart';
import 'package:cafe_craze/data/order_history_data.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

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
                  MyText(
                    text: "Order History",
                    size: 24,
                    fWeight: FontWeight.bold,
                  ),
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

            // Order History List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: orderHistoryItems.length,
                itemBuilder: (context, index) {
                  final order = orderHistoryItems[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Order Header (Date & Total)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: "Order Date",
                                size: 14,
                                fWeight: FontWeight.bold,
                              ),
                              const SizedBox(height: 5),
                              MyText(
                                text: order['date'],
                                size: 14,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              MyText(
                                text: "Total Amount",
                                size: 14,
                                fWeight: FontWeight.bold,
                              ),
                              const SizedBox(height: 5),
                              MyText(
                                text:
                                    "\$ ${order['total_amount'].toStringAsFixed(2)}",
                                size: 14,
                                color: const Color(0xffD17842),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Order Items
                      ...List.generate((order['items'] as List).length, (
                        itemIndex,
                      ) {
                        final item = (order['items'] as List)[itemIndex];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color(0xff141921),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            children: [
                              // Item Header
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          item['image'],
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            text: item['title'],
                                            size: 16,
                                            fWeight: FontWeight.bold,
                                          ),
                                          const SizedBox(height: 5),
                                          MyText(
                                            text: item['subtitle'],
                                            size: 12,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "\$ ",
                                          style: TextStyle(
                                            color: Color(0xffD17842),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: item['item_total']
                                              .toStringAsFixed(2),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              // Item Details Rows
                              ...List.generate((item['details'] as List).length, (
                                detailIndex,
                              ) {
                                final detail =
                                    (item['details'] as List)[detailIndex];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Size details
                                      Row(
                                        children: [
                                          _buildBadge(detail['size'], true),
                                          const SizedBox(width: 10),
                                          MyText(
                                            text:
                                                "\$ ${detail['price'].toStringAsFixed(2)}",
                                            size: 14,
                                            fWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),

                                      // Quantity
                                      MyText(
                                        text: "X ${detail['quantity']}",
                                        size: 14,
                                        color: const Color(0xffD17842),
                                        fWeight: FontWeight.bold,
                                      ),

                                      // Line Total
                                      MyText(
                                        text: detail['total'].toStringAsFixed(
                                          2,
                                        ),
                                        size: 14,
                                        color: const Color(0xffD17842),
                                        fWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ),

            // Download Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xffD17842),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: MyText(
                    text: "Download",
                    size: 18,
                    fWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String text, bool isLeft) {
    return Container(
      width: 60,
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0xff0c0f14),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: MyText(
          text: text,
          size: 14,
          fWeight: FontWeight.bold,
          // Size is usually white/bold
        ),
      ),
    );
  }
}

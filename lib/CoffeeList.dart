// ignore_for_file: must_be_immutable, file_names

import 'package:cafe_craze/DetailsPage.dart';
import 'package:cafe_craze/MyText.dart';
import 'package:flutter/material.dart';

class Coffeelist extends StatelessWidget {
  Coffeelist({
    super.key,
    required this.scrollController,
    required this.selectedList,
  });
  late ScrollController scrollController;
  List<Map<String, dynamic>> selectedList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: selectedList.length,
        itemBuilder: (context, index) {
          final item = selectedList[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(item: item),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff272b2d).withValues(alpha: 0.5),
                      Color(0xff14181d).withValues(alpha: 0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                width: 140,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: AssetImage(item["img"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.star_rounded,
                                    size: 13,
                                    color: Color(0xffD17842),
                                  ),
                                  MyText(
                                    text: "${item["rating"]}",
                                    fWeight: FontWeight.bold,
                                    size: 11,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      MyText(text: item["title"], size: 13),
                      SizedBox(height: 3),
                      MyText(text: item["extra"], size: 9),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              MyText(
                                text: "\$",
                                size: 15,
                                color: Color(0xffD17842),
                              ),
                              MyText(
                                text: " ${item["price"]}0",
                                size: 15,
                                fWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Color(0xffD17842),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

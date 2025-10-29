import 'package:flutter/material.dart';

import '../model/shoe_model.dart';

class ShoeDetailScreen extends StatelessWidget {
  const ShoeDetailScreen({super.key, required this.shoe});

  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                height: 300.0,
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                        const SizedBox(width: 40), // keeps heart icon aligned
                        IconButton(
                          icon: const Icon(Icons.more_vert),
                          iconSize: 24,
                          tooltip: 'Favorite',
                          splashRadius: 24,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Hero(
                      tag: shoe.image,
                      child: Image.asset(
                        shoe.image,
                        height: screenHeight * 0.25,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Size :',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text('9', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    shoe.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Text(
                    '\$${shoe.price}',
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Text(
                    shoe.description,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              onPressed: () {},
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
      persistentFooterDecoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.transparent),
      ),
    );
  }
}

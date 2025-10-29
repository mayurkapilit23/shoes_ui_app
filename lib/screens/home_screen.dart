import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_ui_app/provider/shoe_provider.dart';
import 'package:shoes_ui_app/screens/shoe_detail_screen.dart';

import '../widgets/custom_shoe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.search),
          SizedBox(width: screenWidth * 0.05),

          Icon(Icons.shopping_bag),
        ],
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shoes',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: screenHeight * 0.04),
              Consumer<ShoeProvider>(
                builder: (context, sp, _) {
                  return Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: sp.shoes.length,
                      itemBuilder: (context, index) {
                        final shoe = sp.shoes[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ShoeDetailScreen(shoe: shoe),
                              ),
                            );
                          },
                          child: CustomShoeCard(
                            shoeName: shoe.name!,
                            shoePrice: shoe.price!,
                            shoeImage: shoe.image!,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

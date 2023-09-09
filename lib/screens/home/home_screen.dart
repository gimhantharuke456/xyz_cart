import 'package:flutter/material.dart';
import 'package:xyz_cart/utils/constants.dart';
import 'package:xyz_cart/widgets/main_container.dart';

const items = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.earbuds),
    label: "Purchase",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.translate),
    label: "Purchase",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.chat),
    label: "Chat",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: "Account",
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContainer(
        child: Column(
          children: [
            SizedBox(
              height: 65,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    color: primaryColor,
                  ))
                ],
              ),
            ),
            Expanded(child: ListView())
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: items),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xyz_cart/utils/constants.dart';
import 'package:xyz_cart/widgets/item_card.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  List<Widget> get widgetContainer => [
        const HomeBody(),
        Container(),
        Container(),
        Container(),
        Container(),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetContainer[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        currentIndex: activeIndex,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        items: items,
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    color: primaryColor,
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height / 3) * 0.8,
                    child: Container(
                      height: kToolbarHeight,
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: 40,
                      ),
                      alignment: Alignment.topCenter,
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Search",
                              border: OutlineInputBorder(),
                            ),
                          )),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0xFFe8e4da),
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "Featured",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(defaultPadding),
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return const ItemCard();
                }),
          )
        ],
      ),
    );
  }
}

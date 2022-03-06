import 'package:ecommerce/screens/cart_screen/cart_screen.dart';
import 'package:ecommerce/screens/home_screen/home_screen.dart';
import 'package:ecommerce/screens/profile_screen/profile_screen.dart';
import 'package:ecommerce/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

class BottomBarNavigationScreen extends StatefulWidget {
  const BottomBarNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomBarNavigationScreenState createState() =>
      _BottomBarNavigationScreenState();
}

class _BottomBarNavigationScreenState extends State<BottomBarNavigationScreen> {
  int _selectedIndex = 0;
  late PageController pageController;
  int cartNumber = 0;
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: pageController,
        children: _pages,
        onPageChanged: _onItemTapped,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(
                  Icons.shopping_cart,
                ),
                cartNumber > 0
                    ? Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: Text(
                            cartNumber.toString(),
                            style: const TextStyle(
                                fontSize: 6, color: Colors.white),
                          ),
                        ))
                    : const SizedBox(),
              ],
            ),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        selectedItemColor: Theme.of(context).indicatorColor,
        onTap: (index) {
          _onItemTapped(index);
          pageController.animateToPage(_selectedIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutQuad);
        },
      ),
    );
  }
}

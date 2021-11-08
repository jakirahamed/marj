import 'package:flutter/material.dart';
import 'package:marj/ui/bottom_nav_pages/cart.dart';
import 'package:marj/ui/bottom_nav_pages/favourite.dart';
import 'package:marj/ui/bottom_nav_pages/home.dart';
import 'package:marj/ui/bottom_nav_pages/Search.dart';
import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({Key? key}) : super(key: key);

  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  bool navBarMode = false;

  final _pages = [
    Home(),
    Search(),
    Favourite(),
    Cart(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Colors.blue,
        unSelectedColor: Colors.black54,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.Top,
        // gradient: LinearGradient(
        //   colors: kGradients,
        // ),

        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Home',
            icon: Icons.home,
          ),
          CustomBottomBarItems(
            label: 'Search',
            icon: Icons.search,
          ),
          CustomBottomBarItems(label: 'favorites', icon: Icons.favorite),
          CustomBottomBarItems(
            label: 'Cart',
            icon: Icons.shopping_cart,
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}

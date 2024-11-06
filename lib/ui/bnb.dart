import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:stylish/ui/cart.dart';
import 'package:stylish/ui/homepage.dart';
import 'package:stylish/ui/orders.dart';
import 'package:stylish/ui/search.dart';
import 'package:stylish/ui/settings.dart';
import 'package:stylish/ui/wishlist.dart';

class bnb extends StatefulWidget {
  const bnb({super.key});

  @override
  State<bnb> createState() => _bnbState();
}

class _bnbState extends State<bnb> {
  final controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildscreen() {
    return [home(), wishlist(), orders(), search(), settings()];
  }

  List<PersistentBottomNavBarItem> _navBaritems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.home,
          ),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: Colors.black),
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.favorite_border,
          ),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: Colors.black),
      PersistentBottomNavBarItem(
          inactiveIcon: Icon(
            CupertinoIcons.cart,
            color: Colors.black,
          ),
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          activeColorPrimary: Colors.red,

          inactiveColorPrimary: Colors.red),
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.search,
          ),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: Colors.black),
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.settings,
          ),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: Colors.black)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildscreen(),
      items: _navBaritems(),
      navBarStyle: NavBarStyle.style15,
      backgroundColor: Colors.white,
      decoration: NavBarDecoration(colorBehindNavBar: Colors.white),
    );
  }
}

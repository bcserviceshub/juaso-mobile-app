
import 'package:flutter/material.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/account/account_page.dart';
import 'package:juaso_mobile_app/features/categories/presentation/pages/categories_page.dart';
import 'package:juaso_mobile_app/features/favorites/presentation/pages/favorite_page.dart';
import 'package:juaso_mobile_app/features/home_page/utils/home_utils.dart';
import 'package:juaso_mobile_app/features/my_cart/presentation/pages/my_cart.dart';
import 'package:juaso_mobile_app/features/shop/presentation/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<Widget> pages = [
    const ShopPage(),
    const CategoriesPage(),
    const FavoritePage(),
    const MyCartPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (value){
            setState(() {
              currentIndex = value;
            });
          },

          items:[
            ... List.generate(
              5,
              (index) => BottomNavigationBarItem(
                icon: Image.asset(homeInactiveIcons[index]),
                activeIcon: Image.asset(homeActiveIcons[index]),
                label: homeTitles[index],
               ),
            ),
          ]
          ),

      body: pages[currentIndex],
    );
  }
}
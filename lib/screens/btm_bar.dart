import 'package:cheriflasugu/screens/cart.dart';
import 'package:cheriflasugu/screens/categories.dart';
import 'package:cheriflasugu/screens/home_screen.dart';
import 'package:cheriflasugu/screens/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 3;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Accueil'},
    {'page': const CategoriesScreen(), 'title': 'Categories'},
    {'page': const CartScreen(), 'title': 'Panier'},
    {'page': const UserScreen(), 'title': 'Profil'},

    // const HomeScreen(),
    // const CategoriesScreen(),
    // const CartScreen(),
    // const UserScreen(),
  ];
  void _selectedPages(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedIndex]['title']),
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: isDark
              ? Theme.of(context).cardColor
              : Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          unselectedItemColor: isDark 
          ? Colors.white10 
          : Colors.black12,
          selectedItemColor: isDark 
          ? Colors.lightBlue.shade200
          :Colors.black87  ,
          onTap: _selectedPages,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: "Accueil",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1
                  ? IconlyBold.category
                  : IconlyLight.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
              label: "Panier",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
              label: "Profil",
            ),
          ]),
    );
  }
}

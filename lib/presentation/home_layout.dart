
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../resoursec/colors.dart';
import '../controller/categories.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<HomeLayout> {
  var cTime;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
      builder: (conyroller){
        return Scaffold(
          backgroundColor: white,
          body: conyroller.bottomScreens[conyroller.cIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            unselectedItemColor: grey,
            currentIndex: conyroller.cIndex,
            backgroundColor: grey.withOpacity(0.1),
            selectedItemColor: red,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Grocery'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.power,
                  ),
                  label: 'News'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.power,
                    color: white,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                // ignore: prefer_const_constructors
                  icon: Icon(
                    Icons.favorite_border_rounded,
                  ),
                  label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_basket,
                  ),
                  label: 'Cart')
            ],
            onTap: (index) {
              conyroller.incrementTab(index);
            },
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.redAccent,
            onPressed: () {
              conyroller.incrementTab(2);
            },
            child: const Icon(Icons.remove_shopping_cart),
          ),
        );
      },
      init: CategoriesController(),
    );


  }


}

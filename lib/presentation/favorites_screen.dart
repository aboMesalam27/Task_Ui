import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_test_ui_sudi/favorite_cahe.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<FavCahe>(
          builder: (controller) {
            return Text(
                'Favorites item length = ${controller.getFavoriteIds().length}');
          },
        ),
      ),
    );
  }
}

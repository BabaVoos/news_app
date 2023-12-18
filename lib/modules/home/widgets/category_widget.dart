import 'package:flutter/material.dart';

import '../../../data_layer/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  final Function onClicked;

  const CategoryWidget({
    Key? key,
    required this.categoryModel,
    required this.index,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClicked();
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: BorderRadiusDirectional.only(
            topStart: const Radius.circular(
              25.0,
            ),
            topEnd: const Radius.circular(25.0),
            bottomStart: index % 2 == 0
                ? const Radius.circular(25.0)
                : const Radius.circular(0.0),
            bottomEnd: index % 2 != 0
                ? const Radius.circular(25.0)
                : const Radius.circular(0.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              categoryModel.image,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              categoryModel.title,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

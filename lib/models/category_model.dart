import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String title;
  String image;
  Color backgroundColor;

  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.backgroundColor,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: 'Sports',
      title: 'Sports',
      image: 'assets/images/sports.png',
      backgroundColor: const Color(0XFFC91C22),
    ),
    CategoryModel(
      id: 'Politics',
      title: 'Politics',
      image: 'assets/images/politics.png',
      backgroundColor: const Color(0XFF003E90),
    ),
    CategoryModel(
      id: 'Health',
      title: 'Health',
      image: 'assets/images/health.png',
      backgroundColor: const Color(0XFFED1E79),
    ),
    CategoryModel(
      id: 'Business',
      title: 'Business',
      image: 'assets/images/business.png',
      backgroundColor: const Color(0XFFCF7E48),
    ),
    CategoryModel(
      id: 'Environment',
      title: 'Environment',
      image: 'assets/images/environment.png',
      backgroundColor: const Color(0XFF4882CF),
    ),
    CategoryModel(
      id: 'Science',
      title: 'Science',
      image: 'assets/images/science.png',
      backgroundColor: const Color(0XFFF2D352),
    ),
  ];
}

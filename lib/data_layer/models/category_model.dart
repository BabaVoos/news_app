import 'package:flutter/material.dart';

import '../shared_preferences.dart';

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

  bool isArabic() {
    return CacheHelper.getStringData(key: 'language') == 'ar';
  }

  static List<CategoryModel> categories = [
    CategoryModel(
      id: 'sports',
      title: CacheHelper.getStringData(key: 'language') == 'ar'
          ? "الرياضة"
          : 'Sports',
      image: 'assets/images/sports.png',
      backgroundColor: const Color(0XFFC91C22),
    ),
    CategoryModel(
      id: 'technology',
      title: CacheHelper.getStringData(key: 'language') == 'ar'
          ? 'التكنولوجيا'
          : 'Technology',
      image: 'assets/images/tech.png',
      backgroundColor: const Color(0XFF003E90),
    ),
    CategoryModel(
      id: 'health',
      title: CacheHelper.getStringData(key: 'language') == 'ar'
          ? 'الصحة'
          : 'Health',
      image: 'assets/images/health.png',
      backgroundColor: const Color(0XFFED1E79),
    ),
    CategoryModel(
      id: 'business',
      title: CacheHelper.getStringData(key: 'language') == 'ar'
          ? 'التجارة'
          : 'Business',
      image: 'assets/images/business.png',
      backgroundColor: const Color(0XFFCF7E48),
    ),
    CategoryModel(
      id: 'entertainment',
      title: CacheHelper.getStringData(key: 'language') == 'ar'
          ? 'التسلية'
          : 'Entertainment',
      image: 'assets/images/entertainment.png',
      backgroundColor: const Color(0XFF4882CF),
    ),
    CategoryModel(
      id: 'science',
      title: CacheHelper.getStringData(key: 'language') == 'ar'
          ? 'العلوم'
          : 'Science',
      image: 'assets/images/science.png',
      backgroundColor: const Color(0XFFF2D352),
    ),
  ];
}

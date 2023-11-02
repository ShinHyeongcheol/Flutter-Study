import 'package:flutter/material.dart';
import 'package:section8910/data/dummy_data.dart';
import 'package:section8910/models/meal.dart';
import 'package:section8910/screens/meals.dart';
import 'package:section8910/widgets/category_grid_item.dart';

import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key,
    required this.onToggleFavorite,
    required this.availableMeals,
  }) : super(key: key);

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where(
          (meal) => meal.categories.contains(
            category.id,
          ),
        )
        .toList();
    // 카테고리의 id를 통한 필터링 이후 값을 사용하기 위한 리스트 변환

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
    //Navigator.push(context, route)
    //Material Page에 새로운 창, MealsScreen에 타이틀, 필터링된 음식 전달
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        //availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
              // 위의 반복문에서의 category를 받아서 _selectCategory 실행
            },
          ),
      ],
    );
  }
}

///import relevant package
import 'package:flutter/material.dart';
import 'package:food_recipes/components/components.dart';
import 'package:food_recipes/models/meal_model.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function toggleFavorites;
  final Function isFavorite;

  MealDetailsScreen(this.toggleFavorites, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    ///ModalRoute.of(context) returns a nullable value, so the ! operator is used to force unwrap the value and access its settings.arguments property. This is then cast to a String using the as keyword, since we know that arguments is of type String.
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    ///selectedMeal is then defined as the first item in the MEALRecipes list that matches the mealId. The function (meal) => meal.id == mealId is used, which returns true for any meal object that has an id property that matches the mealId.
    ///This code is likely part of a larger application that displays recipes or meals, and uses the mealId to identify which meal to display.
    final selectedMeal = MEALRecipes.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
        backgroundColor: firstColor,
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [firstColor, secondColor, thirdColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [firstColor, secondColor, thirdColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  height: 320,
                  width: double.infinity,
                  child: Image.network(selectedMeal.mealImage),
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  'Gradients',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 190,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Card(
                      elevation: 20,
                      color: secondColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 19),
                        child: Text(selectedMeal.ingredients[index],
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                            )),

                      ),
                    ),
                    itemCount: selectedMeal.ingredients.length,
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  'Steps',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 190,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Card(
                      elevation: 20,
                      color: secondColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: firstColor,
                              child: Text(
                                'Step ${(index + 1)} : ',
                                style: Theme.of(context).textTheme.subtitle1,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                                fit: FlexFit.loose,
                                child: Text(
                                  selectedMeal.steps[index],
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  softWrap: false,
                                ))
                          ],
                        ),
                      ),
                    ),
                    itemCount: selectedMeal.steps.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ///this code is likely part of a larger application that displays recipes or meals and allows the user to favorite them. The FloatingActionButton widget is used to provide a visual cue for the favorite action and the onPressed property is used to toggle the favorite state of the meal. The isFavorite function determines whether a meal is currently favorited.
      floatingActionButton: FloatingActionButton(
        child:
            Icon(isFavorite(mealId) ? Icons.favorite : Icons.favorite_border),
        onPressed: () => toggleFavorites(mealId),
      ),
    );
  }
}

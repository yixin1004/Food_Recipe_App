///import relevant package
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_recipes/components/components.dart';
import 'package:food_recipes/models/meal_model.dart';
import 'package:food_recipes/modules/categories_screen.dart';
import 'package:food_recipes/modules/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  static const bodyStyle = TextStyle(fontSize: 19.0);
  List<MealModel> favorites = [];
  List<PageViewModel> getOnBoarding = [
    PageViewModel(
        title: 'First, we eat. Then, we do everything else',
        body:
            'Despite what psychologists say, it’s totally okay to replace love with food',
        image: const Image(
            image: NetworkImage(
                'https://img.freepik.com/free-photo/tortilla-wrap-with-falafel-fresh-salad-vegan-tacos-vegetarian-healthy-food-top-view_2829-6197.jpg?size=338&ext=jpg'))),
    PageViewModel(
        title: 'Good food, good mood.',
        body:
            'Whenever you see me seemingly thinking deep thoughts, I’m probably just thinking about food.',
        image: const Image(
            image: NetworkImage(
                'https://image.freepik.com/free-photo/vegetarian-falafel-with-vegetables-tzatziki-sauce-tortilla-bread-dark-wooden-background-top-view-copy-space_89816-28026.jpg'))),
    PageViewModel(
        title: 'If the fries is right, then we have a deal!',
        body:
            'We are lucky that we don’t have to venture into the wild and hunt for food anymore',
        image: const Image(
            image: NetworkImage(
                'https://image.freepik.com/free-photo/pizza-time-tasty-homemade-traditional-pizza-italian-recipe_144627-42528.jpg'))),
  ];
  ///the "introKey" variable can be used to identify and manage the state of a widget of type "IntroductionScreenState".
  final introKey = GlobalKey<IntroductionScreenState>();
  static const pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: bodyStyle,
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.pinkAccent,
    imagePadding: EdgeInsets.zero,
  );

  void onDone(context) {
    ///The "pushReplacement" method is called on the "Navigator" instance to replace the current route (i.e., screen) with a new one.
    Navigator.of(context).pushReplacement(
      ///The "MaterialPageRoute" class is used to define the new route to navigate to. In this case, it takes a builder function as an argument that returns an instance of the "HomeScreen" widget. The "favorites" variable is passed as an argument to the "HomeScreen" widget constructor.
      MaterialPageRoute(builder: (_) => HomeScreen(favorites)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [firstColor, secondColor, thirdColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      ///This widget is a part of the "introduction_screen" package in Flutter, which provides a pre-built introduction screen UI for the app.
      child: IntroductionScreen(
        color: secondColor,
        globalBackgroundColor: secondColor,
        doneColor: Colors.black,
        skipColor: Colors.black,
        nextColor: Colors.black,
        done: const Text('Done'),
        next: const Text('Next'),
        skip: const Text('Skip'),
        ///These parameters define the callback functions to be called when the "Done" and "Skip" buttons are pressed, respectively. In this code, both callbacks call the "onDone" function with the current context.
        onDone: () => onDone(context),
        onSkip: () => onDone(context),
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        ///The "getOnBoarding" function is called to get this list.
        pages: getOnBoarding,
        curve: Curves.decelerate,
      ),
    );
  }
}

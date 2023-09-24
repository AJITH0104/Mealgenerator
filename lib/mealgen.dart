import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealgen/mealmodel.dart';
import 'package:mealgen/mealprovider.dart';
import 'package:url_launcher/url_launcher.dart';

class mealgen extends ConsumerWidget {
  const mealgen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Mealmodel> meal = ref.watch(mealprovider);
    return Scaffold(
      body: meal.when(
          error: (err, stack) => Center(
                child: Text(err.toString()),
              ),
          loading: () => Center(
                child: CircularProgressIndicator(),
              ),
          data: (recipe) {
            recipe.ingred.removeWhere(
                (element) => element.name == null || element.name == '');
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(recipe.image), fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.name,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 30,
                            ),
                          ),
                          //  SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Chip(
                                    label: Center(
                                      child: Text(
                                        recipe.category,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ),
                                    backgroundColor: Colors.orange.shade300,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Chip(
                                    label: Center(
                                      child: Text(
                                        recipe.area,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ),
                                    backgroundColor: Colors.orange.shade300,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.redAccent),
                                  onPressed: () async {
                                    if (recipe.utubeurl != null &&
                                        recipe.utubeurl != '') {
                                      if (await canLaunchUrl(
                                          Uri.parse(recipe.utubeurl))) {
                                        final bool nativelaunch =
                                            await launchUrl(
                                          Uri.parse(recipe.utubeurl),
                                          mode: LaunchMode.externalApplication,
                                        );
                                      }
                                    }
                                  },
                                  child: Text(
                                    'YOUTUBE',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Ingredients',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: recipe.ingred.map((ingredient) {
                                return Column(
                                  children: [
                                    Image(
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://www.themealdb.com/images/ingredients/${ingredient.name}.png'),
                                    ),
                                    Text(
                                      ingredient.name,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      ingredient.measure,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Instructions',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            recipe.instructs,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

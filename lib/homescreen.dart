import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealgen/mealgen.dart';
import 'package:mealgen/mealprovider.dart';

class Homescreen extends ConsumerWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/food.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Feeling Hungry',
                  style: GoogleFonts.playfair(
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {
                    ref.refresh(mealprovider);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => mealgen()));
                  },
                  child: Text(
                    'Click me for MEAL',
                    style: GoogleFonts.play(
                        fontSize: 30,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.redAccent.shade100),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

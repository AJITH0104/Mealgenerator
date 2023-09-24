import 'dart:convert';

import 'mealmodel.dart';
import 'package:http/http.dart' as http;
class mealrepo{
   Future<Mealmodel> getmeal() async{
     http.Response response=await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));
return Mealmodel.fromJson(jsonDecode(response.body));
  }
}
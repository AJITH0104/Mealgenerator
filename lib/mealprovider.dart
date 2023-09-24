
import 'package:mealgen/mealmodel.dart';
import 'package:riverpod/riverpod.dart';
import 'mealrepo.dart';

final mealprovider=FutureProvider<Mealmodel>((ref) {
  return mealrepo().getmeal();
});
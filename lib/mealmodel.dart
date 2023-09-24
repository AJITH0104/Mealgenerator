class Mealmodel {
  final String name, id, category, area, instructs, image, utubeurl;
  final List<ing> ingred;
  Mealmodel(this.name, this.id, this.category, this.image, this.area,
      this.ingred, this.instructs, this.utubeurl);

  Mealmodel.fromJson(Map<String, dynamic> json)
      : id = json['meals'][0]['idMeal'],
        name = json['meals'][0]['strMeal'],
        category = json['meals'][0]['strCategory'],
        instructs = json['meals'][0]['strInstructions'],
        image = json['meals'][0]['strMealThumb'],
        utubeurl = json['meals'][0]['strYoutube'],
        area = json['meals'][0]['strArea'],
        ingred = List.generate(
            20,
            (index) => ing(json['meals'][0]['strIngredient${index + 1}'],
                json['meals'][0]['strMeasure${index + 1}']));
}

class ing {
  final String name, measure;

  ing(this.name, this.measure);
}

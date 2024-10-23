class Food {
  String name;
  String price;
  String image;
  String rating;

  Food(
      {required this.name,
      required this.price,
      required this.image,
      required this.rating});

  String get _name => name;
  String get _price => price;
  String get _image => image;
  String get _rating => rating;
}

class BookModel {
  int id;
  String titleBook;
  String authorBook;
  String descriptionBook;
  String imageBook;

  BookModel({
    required this.id,
    required this.titleBook,
    required this.authorBook,
    required this.descriptionBook,
    required this.imageBook,
  });

  //Factory es para crear objetos del modelo
  factory BookModel.fromMapToModel(Map<String,dynamic> mapa) => BookModel(
    id: mapa["id"],
    titleBook: mapa["title"],
    authorBook: mapa["author"],
    descriptionBook: mapa["description"],
    imageBook: mapa["image"],
  );
}

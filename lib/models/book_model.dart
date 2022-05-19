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
  //Convierte un mapa a una instancia de la clase
  factory BookModel.fromMapToModel(Map<String,dynamic> mapa) => BookModel(
    id: mapa["id"],
    titleBook: mapa["title"],
    authorBook: mapa["author"],
    descriptionBook: mapa["description"],
    imageBook: mapa["image"],
  );

  factory BookModel.fromJson(Map<String,dynamic> mapa) => BookModel(
    id: mapa["id"],
    titleBook: mapa["title"],
    authorBook: mapa["author"],
    descriptionBook: mapa["description"],
    imageBook: mapa["image"],
  );

  Map<String, dynamic> toJson()=>{
    "id": id,
    "title": titleBook,
    "author": authorBook,
    "description": descriptionBook,
    "image": imageBook,
  };

}

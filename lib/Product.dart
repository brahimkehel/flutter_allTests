class Product {
  String reference, description;
  double prix;
  int id, idCategorie;

  Product({this.reference, this.description, this.prix, this.idCategorie});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["reference"] = reference;
    map["description"] = description;
    map["prix"] = prix;
    map["idCategorie"] = idCategorie;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Product.fromObject(dynamic o) {
    this.id = o["id"];
    this.reference = o["reference"];
    this.description = o["description"];
    this.prix = o["prix"];
    this.idCategorie = o["idCategorie"];
  }
}

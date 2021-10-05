class ItemModel {
  String? name;
  String? title;
  String? street;

  ItemModel({
    this.name,
    this.title,
    this.street,
  });

  ItemModel.fromFire(Map <String, dynamic> fire){
    name = fire['name'];
    title = fire['title'];
    street = fire['street'];
  }


  Map <String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'street': street,
    };
  }

}

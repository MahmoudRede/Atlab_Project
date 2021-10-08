class ItemModel {
  String? name;
  String? price;
  String? details;

  ItemModel({
    this.name,
    this.price,
    this.details,
  });

  ItemModel.fromFire(Map <String, dynamic> fire){
    name = fire['name'];
    price = fire['price'];
    details = fire['details'];
  }


  Map <String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'details' : details,
    };
  }

}

class ItemModel {
  String? name;
  String? price;

  ItemModel({
    this.name,
    this.price,
  });

  ItemModel.fromFire(Map <String, dynamic> fire){
    name = fire['name'];
    price = fire['price'];
  }


  Map <String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }

}

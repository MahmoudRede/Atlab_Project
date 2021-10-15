class OrderModel {
  String? name;
  int? number;
  String? price;

  OrderModel({
    this.number,
    this.name,
    this.price,
  });

  OrderModel.fromFire(Map <String, dynamic> fire){
    number = fire['number'];
    name = fire['name'];
    price = fire['price'];

  }

  Map <String, dynamic> toMap() {
    return {
      'number': number,
      'name' : name,
      'price' : price,

    };
  }

}

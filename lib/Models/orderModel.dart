class OrderModel {
  String? name;
  int? number;
  String? size;
  String? restaurantName;
  String? category;
  String? price;

  OrderModel({
    this.number,
    this.name,
    this.price,
    this.category,
    this.size,
    this.restaurantName,
  });

  OrderModel.fromFire(Map <String, dynamic> fire){
    number = fire['number'];
    name = fire['name'];
    price = fire['price'];
    category = fire['category'];
    size = fire['size'];
    restaurantName = fire['restaurantName'];
  }

  Map <String, dynamic> toMap() {
    return {
      'number': number,
      'name' : name,
      'price' : price,
      'category' : category,
      'size' : size,
      'restaurantName' : restaurantName,
    };
  }

}

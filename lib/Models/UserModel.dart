class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? address;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.address,

  });

  UserModel.fromFire(Map <String , dynamic> fire ){
    name = fire['name'];
    email = fire['email'];
    phone = fire['phone'];
    uId = fire['uId'];
    address = fire['address'];

  }


  Map <String , dynamic> toMap (){
    return {
      'name' : name ,
      'email' : email ,
      'phone' : phone ,
      'uId' : uId ,
      'address': address ,
    };
  }


}
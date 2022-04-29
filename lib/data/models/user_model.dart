class UserModel{
  String? name,email,phone,location,password;
  int? id;

  UserModel({this.name, this.email, this.phone, this.location, this.id,this.password});

  toJson(street,uid){
    return {
      'id':uid,
      'userName': name,
      'userPhone': phone,
      'userEmail': email,
      'userLocation': street,



    };


  }
  UserModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    name=json['userName'];
    phone=json['userPhone'];
    email=json['userEmail'];
    location=json['userLocation'];



  }
}
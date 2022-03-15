class UserModel{
  String? name,email,phone,location;
  int? id;

  UserModel({this.name, this.email, this.phone, this.location, this.id});

  toJson(){
    return {
      'id':id,
      'userName': name,
      'userPhone': phone,
      'userEmail': email,
      'userLocation': location,



    };

  }
}
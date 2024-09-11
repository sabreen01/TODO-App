class SocialUserModel{
  String? name;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVerified;
  String? image;
  String? cover;
  String? bio;
  SocialUserModel({this.name, this.email, this.phone, this.uId, this.isEmailVerified,this.image,this.bio,this.cover});
  SocialUserModel.fromjson(Map<String,dynamic>json)
  {
    email=json['email'];
    name=json['name'];
    phone=json['phone'];
    uId=json['uId'];
    isEmailVerified=json['isEmailVerified'];
    image=json['image'];
    bio=json['bio'];
    cover=json['cover'];
  }
  Map<String,dynamic>toMap()
  {
    return {
      'name':name,
      'phone':phone,
      'email':email,
      'uId':uId,
      'isEmailVerified':isEmailVerified,
      'image':image,
      'bio':bio,
      'cover':cover
  };
  }
}
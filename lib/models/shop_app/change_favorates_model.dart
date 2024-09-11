class ChangeFavoratesModel{
  bool? status;
  String? message;
  ChangeFavoratesModel.fromjson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
  }
}
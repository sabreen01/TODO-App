class HomeModel
{
  bool? status;
  HomeDataModel? data;
  HomeModel.fromjson(Map<String,dynamic>json){
   status=json['status'];
   data=HomeDataModel.fromjson(json['data']);
   }
}

class HomeDataModel{
   List<bannerModel>?banners=[];
   List<productModel>?products=[];

  HomeDataModel.fromjson(Map<String,dynamic>json) {
    json['banners'].forEach((element){
      banners?.add(bannerModel.fromjson(element));
    });
    json['products'].forEach((element){
      products?.add(productModel.fromjson(element));
    });
  }
}

class bannerModel
{
   late int id;
   late String image;
  bannerModel.fromjson(Map<String,dynamic>json){
    id=json['id'];
    image=json['image'];
  }
}

class productModel
{
  late int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discounts;
  late String image;
  late String name;
  late bool inFavourates;
  late bool inCart;
  productModel.fromjson(Map<String,dynamic>json){
    id=json['id'];
    price=json['price'];
    oldPrice=json['old_price'];
    discounts=json['discount'];
    image=json['image'];
    name=json['name'];
    inFavourates=json['in_favorites'];
    inCart=json['in_cart'];
  }
}
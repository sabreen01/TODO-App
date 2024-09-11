class CategoriesModel{
  bool? status;
  CategoriesDataModel? data;
  CategoriesModel.fromjson(Map<String,dynamic>json)
  {
    status=json['status'];
    data=CategoriesDataModel.fromjson(json['data']);
  }
}

class CategoriesDataModel{
  int? currentPage;
  List<DataModel>? data=[];
  //String? first_page_url;
  //int? total;
  CategoriesDataModel.fromjson(Map<String,dynamic>json)
  {
    currentPage=json['current_page'];
   // first_page_url=json['first_page_url'];
   // total=json['total'];
    // json['banners'].forEach((element){
    //   banners?.add(bannerModel.fromjson(element));
    // });
    json['data'].forEach((element)
    {
      data?.add(DataModel.fromjson(element));
    });
  }
}

class DataModel{
  int? id;
  String? image;
  String? name;
  DataModel.fromjson(Map<String,dynamic>json)
  {
    id=json['id'];
    image=json['image'];
    name=json['name'];
  }
}
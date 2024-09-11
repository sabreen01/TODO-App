import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/models/shop_app/favorates_model.dart';
import 'package:untitled/models/shop_app/home_model.dart';
import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/modules/shop_app/categories/categories_screen.dart';
import 'package:untitled/modules/shop_app/favourates/favourate_screen.dart';
import 'package:untitled/modules/shop_app/products/products_screen.dart';
import 'package:untitled/modules/shop_app/settings/settings_screen.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/end_point.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import '../../../models/shop_app/categories_model.dart';
import '../../../models/shop_app/change_favorates_model.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit(): super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;
  List<Widget>bottomScreens=[
    ProductsScreen(),
    CategoriesScreen(),
    FavourateScreen(),
    SettingsScreen(),
  ];
  void ChangeBottom(int index)
  {
    currentIndex=index;
    emit(ShopChangeButtonNavState());
  }

  HomeModel? homeModel;

  Map<int,bool>favourate={};

  void getHomeData()
  {
    emit(ShopLoadingHomeState());
    DioHelper.getData(
        url: HOME,
        token:token,
    ).then((value) {
      homeModel=HomeModel.fromjson(value.data);

      homeModel?.data?.products?.forEach((element) {

        favourate.addAll({
          element.id!:element.inFavourates!
        });

      });
      print(favourate.toString()!);

     // print(homeModel?.data?.banners[0].image);
     // print(homeModel?.data!.banners?[0].id);
      print(homeModel?.status!);
     // print(homeModel.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategories()
  {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token:token,
    ).then((value) {
      categoriesModel=CategoriesModel.fromjson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }


  FavorateModel? favoratesModel;
  void getFavorates()
  {
    emit(ShopLoadingGetFavoratesState());

    DioHelper.getData(
      url: FAVORATES!,
      token:token!,
    ).then((value) {
      favoratesModel=FavorateModel.fromJson(value.data!);
      print(favoratesModel!.toString());
      emit(ShopSuccessGetFavoratesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetFavoratesState());
    });
  }

  ChangeFavoratesModel? changeFavoratesModel;
  void changeFavorates(int productId)
  {
    favourate[productId!]=!favourate[productId!]!;
    emit(ShopChangeFavoratesState());

    DioHelper.postData(
      url: FAVORATES,
      data:{
        'product_id':productId!,
      } ,
      token:token,
    ).then((value) {
      changeFavoratesModel=ChangeFavoratesModel.fromjson(value.data!)!;
     //  print(changeFavoratesModel!);
      if(!changeFavoratesModel!.status!)
      {
        favourate[productId]=!favourate[productId]!;
      }
      else
      {
        getFavorates();
      }
      emit(ShopSuccessChangeFavoratesState(changeFavoratesModel!));
    }).catchError((error){
      favourate[productId]=!favourate[productId]!;
      print(error.toString());
      emit(ShopErrorChangeFavoratesState());
    });
  }

  ShopLoginModel? userModel;
  void getUserData()
  {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      url: PROFILE!,
      token:token!,
    ).then((value) {
      userModel=ShopLoginModel.fromjson(value.data!);
      print(userModel!.data!.id);
      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void UpdateUserData({
    required String name,
    required String email,
    required String phone
})
  {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token:token,
      data: {
        'name':name,
        'phone':phone,
        'email':email,

      },
    ).then((value) {
      userModel=ShopLoginModel.fromjson(value.data!);
      print(userModel!.data!.id);
      emit(ShopSuccessUpdateUserState(userModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }

}
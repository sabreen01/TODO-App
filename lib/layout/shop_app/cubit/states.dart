import 'package:untitled/models/shop_app/change_favorates_model.dart';
import 'package:untitled/models/shop_app/login_model.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ShopChangeButtonNavState extends ShopStates{}

class ShopLoadingHomeState extends ShopStates{}

class ShopSuccessHomeDataState extends ShopStates{}

class ShopErrorHomeDataState extends ShopStates{}

class ShopSuccessCategoriesState extends ShopStates{}

class ShopErrorCategoriesState extends ShopStates{}

class ShopChangeFavoratesState extends ShopStates{}

class ShopSuccessChangeFavoratesState extends ShopStates{
  final ChangeFavoratesModel model;

  ShopSuccessChangeFavoratesState(this.model);
}

class ShopErrorChangeFavoratesState extends ShopStates{}

class ShopLoadingGetFavoratesState extends ShopStates{}

class ShopSuccessGetFavoratesState extends ShopStates{}

class ShopErrorGetFavoratesState extends ShopStates{}

class ShopLoadingUserDataState extends ShopStates{}

class ShopSuccessUserDataState extends ShopStates{
  final ShopLoginModel shopLoginModel;

  ShopSuccessUserDataState(this.shopLoginModel);
}

class ShopErrorUserDataState extends ShopStates{}

class ShopLoadingUpdateUserState extends ShopStates{}

class ShopSuccessUpdateUserState extends ShopStates{
  final ShopLoginModel shopLoginModel;

  ShopSuccessUpdateUserState(this.shopLoginModel);
}

class ShopErrorUpdateUserState extends ShopStates{}


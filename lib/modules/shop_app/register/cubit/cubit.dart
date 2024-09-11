
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/modules/shop_app/register/cubit/states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import '../../../../shared/network/end_point.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>{
  ShopRegisterCubit(): super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context)=>BlocProvider.of(context);

  ShopLoginModel? loginModel;
  //ShopLoginModel loginModel

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
}){
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data: {
          'name':name,
          'phone': phone,
          'email': email,
          'password': password,

        },

    ).then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromjson(value.data);
      //print(loginModel?.data?.name);
      emit(ShopRegisterSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  IconData suffix= Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordVisibility()
  {
    isPassword=!isPassword;
    suffix= isPassword? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ShopRegisterChangePasswordVisibilityState());
  }

}
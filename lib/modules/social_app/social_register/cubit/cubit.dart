


import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/social_app/social_user_model.dart';
import 'package:untitled/modules/social_app/social_register/cubit/states.dart';

import '../../../../shared/network/remote/dio_helper.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates>{
  SocialRegisterCubit(): super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context)=>BlocProvider.of(context);




  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,


}){
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      userCreate(
          uId: value.user!.uid,
          phone: phone,
          email: email,
          name: name,

      );
     // emit(SocialRegisterSuccessState());
    }).catchError((error){
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,

  }){

    SocialUserModel model=SocialUserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        isEmailVerified: false,
        image: 'https://img.freepik.com/premium-photo/agronomist-woman-pink-with-pink-flowers_969090-135.jpg?w=996',
        bio: 'write your bio...',
        cover: 'https://img.freepik.com/free-photo/slice-pizza-hand-closeup-selective-focus-lunch-time-tratoria-delicious-pizza-with-sundried-tomatoes-with-mozzarella-cheese-cut-into-slices-lunch-pizzeria_166373-3656.jpg?w=996&t=st=1694910193~exp=1694910793~hmac=3babf83d6b46a4828f70b9ef9ffed4e93a7e29e022fef33babe6744dc3db664c',

    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap()
    ).then((value) {
          emit(SocialCreateUserSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix= Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordVisibility()
  {
    isPassword=!isPassword;
    suffix= isPassword? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(SocialRegisterChangePasswordVisibilityState());
  }

}
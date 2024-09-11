import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';


import '../../../modules/news_app/business/business_screen.dart';
import '../../../modules/news_app/science/science_screen.dart';
import '../../../modules/news_app/sports/sport_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{

  //NewsCubit(super.initialState);

  NewsCubit() : super(NewsInitialState()) ;


  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List<BottomNavigationBarItem>ButtomItems=[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business
    ),

      label: 'Business',

    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.sports
      ),
      label: 'Sports',

    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.science
      ),
      label: 'science',

    ),
    // BottomNavigationBarItem(
    //   icon: Icon(
    //       Icons.settings
    //   ),
    //   label: 'settings',
    //
    // ),

  ];
  List<Widget>screens=[
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    //SettingsScreen()
  ];

  void changeBottonNavBar(index){
    currentIndex=index;
    // if(index==1)
    //   getSports();
    // else if(index==2)
    //   getScience();

    emit(NewsButtomNavState());
  }

  List<dynamic> business=[];
  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'us',
        'category':'business',
        'apiKey':'e1a00d07c8aa4328affc11faa3c772b6',
      },
    ).then((value) {
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSeccessState());
     // print(value.data['articles'][0]['title']);
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports=[];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    if(sports.length==0)
      {
        DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'us',
            'category':'sports',
            'apiKey':'e1a00d07c8aa4328affc11faa3c772b6',
          },
        ).then((value) {
          sports=value?.data['articles'];
          print(sports[0]['title']);
          emit(NewsGetSportsSeccessState());
          // print(value.data['articles'][0]['title']);
        }).catchError((error){
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        });
      }else
        {
          emit(NewsGetSportsSeccessState());

        }


  }

  List<dynamic> science=[];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if(science.length==0)
      {
        DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'us',
            'category':'science',
            'apiKey':'e1a00d07c8aa4328affc11faa3c772b6',
          },
        ).then((value) {
          science=value?.data['articles'];
          print(science[0]['title']);
          emit(NewsGetScienceSeccessState());
          // print(value.data['articles'][0]['title']);
        }).catchError((error){
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });
      }else{
      emit(NewsGetScienceSeccessState());

    }

  }

  List<dynamic>search=[];
  void getSearch(String value)
  {

    emit(NewsGetScienceLoadingState());
   // search=[];
    DioHelper.getData(
      url: 'v2/everything',
      query: {

        'q':'$value',
        'apiKey':'e1a00d07c8aa4328affc11faa3c772b6',
      },
    ).then((value) {
      search=value?.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSeccessState());
      // print(value.data['articles'][0]['title']);
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });


  }

}
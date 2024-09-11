import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/cubit.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';

import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import '../../modules/news_app/search/search_screen.dart';

class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
              // style: TextStyle(
              //   color: Colors.black
              // ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
               // color: Colors.black,
                onPressed: (){
                  navigateTo(context, SearchScreen());
                },
              ),
              IconButton(
                icon: Icon(Icons.brightness_4_outlined),
                onPressed: (){
                  AppCubit.get(context).changeAppMode();
                },
              ),
            ],
          ),
          bottomNavigationBar:BottomNavigationBar(
            items:cubit.ButtomItems ,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottonNavBar(index);
            },

          ) ,
          body: cubit.screens[cubit.currentIndex],
        );
      },

    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'cubit/cubit.dart';
import 'cubit/states.dart';

//state less contain 1 class provide widget
//state ful contain 2 classes:
//1-first class provide widget
//2-second class provide state from this widget

class CounterScreen extends StatelessWidget {

 // int counter=1;

//1-constructor
//2-init state
//3-build



  @override
  Widget build(BuildContext context) {

   // var c= counterCubit.get(context);

    return BlocProvider(
     // create: (_) => ThemeCubit(),
      create: (BuildContext context) => counterCubit(),
      child: BlocConsumer<counterCubit,counterStates>(
        listener: (context,state){
          if(state is counterPlusState)
          {
           // print('plus state ${state.counter}');
          }
            if(state is counterMunisState)
            {
             // print('munis state ${state.counter}');
            }
          },
        builder: (context,state){

          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'Counter'
              ),
            ),
            body: Center(
              child: Row(
                // mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){

                      counterCubit.get(context).minus();

                    },
                    child: Text(
                        'MINUS'
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${counterCubit.get(context).counter}',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){

                      counterCubit.get(context).plus();

                    },
                    child: Text(
                        'PLUS'
                    ),
                  ),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}



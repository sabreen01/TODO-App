

import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/counter_app/counter/cubit/states.dart';


class counterCubit extends Cubit<counterStates>
{
  //counterCubit(super.initialState);

  counterCubit():super(counterInitiateState());

  //counterCubit c=BlocProvider.of(context);
  static counterCubit get(context)=>BlocProvider.of(context);
  int counter=1;
  void minus()
  {
    counter--;
    emit(counterMunisState(counter));
  }
  void plus()
  {
    counter++;
    emit(counterPlusState(counter));
  }
}


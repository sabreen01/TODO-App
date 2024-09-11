import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';

import '../../../shared/components/components.dart';



class NewTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   // return Container();
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var tasks=AppCubit.get(context).newTasks;
        return tasksBuilder(tasks: tasks);
      },

    );
  }
}

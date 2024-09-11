import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';


import '../../shared/components/constants.dart';

// 1- create database
// 2- create tables
// 3- open database
// 4- insert to database
// 5- get from database
// 6- update in database
// 7- delete from database

class HomeLayout extends StatelessWidget {



  var scaffoldKey=GlobalKey<ScaffoldState>();
  var formKey=GlobalKey<FormState>();

  var titleController=TextEditingController();
  var timeController=TextEditingController();
  var dateController=TextEditingController();



  @override
  Widget build(BuildContext context) {



    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){
          if(state is AppInsertDataBaseState)
            {
              Navigator.pop(context);
            }
        },
        builder: (context,state){
          AppCubit cubit=AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                AppCubit.get(context).titles[AppCubit.get(context).indexx],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                if(cubit.isButtonSheetShown)
                {
                  if(formKey.currentState!.validate()) {
                    cubit.insertToDatabase(title: titleController.text, time: timeController.text, date: dateController.text);
                    // insertToDatabase(
                    //   title: titleController.text,
                    //   time: timeController.text,
                    //   date: dateController.text,
                    //
                    // ).then((value) {
                    //   getDataFromDatabase(database).then((value) {
                    //     Navigator.pop(context);
                    //     // setState(() {
                    //     //
                    //     //   isButtonSheetShown = false;
                    //     //   fabIcon = Icons.edit;
                    //     //
                    //     //   tasks=value;
                    //     // });
                    //
                    //     // print(tasks[0]['title']);
                    //     // print(tasks[0]['time']);
                    //     // print(tasks[0]['date'
                    //   });
                    //
                    // });

                  }
                }
                else {
                  scaffoldKey.currentState?.showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsetsDirectional.all(20),

                      child: Form(
                        key: formKey,
                        child: Column(

                          mainAxisSize: MainAxisSize.min,
                          children:
                          [
                            defaultFormField(
                              controller:titleController,
                              type: TextInputType.text,
                              validate:(String? value){
                                if(value!.isEmpty)
                                {
                                  return 'title must not be empty';
                                }
                                return null;
                              },
                              lable: 'Task Title',
                              prefix: Icons.title,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller:timeController,
                              type: TextInputType.datetime,
                              onTap: (){
                                showTimePicker(
                                  context: context,
                                  initialTime:TimeOfDay.now(),
                                ).then((value) {
                                  timeController.text=value!.format(context) ;
                                  print(value?.format(context));
                                });
                              },
                              validate:(String? value){
                                if(value!.isEmpty)
                                {
                                  return 'time must not be empty';
                                }
                                return null;
                              },
                              lable: 'Task Time',
                              // isClickable: false,
                              prefix: Icons.watch_later_outlined,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller:dateController,
                              type: TextInputType.datetime,
                              // isClickable: false,
                              onTap: (){
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2023-09-15'),
                                ).then((value) {
                                  print(DateFormat.yMMMd().format(value!));
                                  dateController.text=DateFormat.yMMMd().format(value!) ;
                                });
                              },

                              validate:(String? value){
                                if(value!.isEmpty)
                                {
                                  return 'date must not be empty';
                                }
                                return null;
                              },
                              lable: 'Task Date',
                              prefix: Icons.calendar_today,
                            ),
                          ],
                        ),
                      ),
                    ),
                    elevation: 20,
                  ).closed.then((value) {
                    cubit.changeBottomSheerState(isShow: false, icon:Icons.edit );

                  });
                  cubit.changeBottomSheerState(isShow: true, icon:Icons.add );
                 // isButtonSheetShown=true;
                  // setState(() {
                  //   fabIcon=Icons.add;
                  // });
                }
                // insertToDatabase();
              },
              child: Icon(
                  cubit.fabIcon
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex:cubit.indexx,
              onTap: (index){
               // indexx=index

                   cubit.changeIndex(index);


              },
              items:
              [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',
                )
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDataBaseLoadingState,
              builder: (BuildContext context) =>  cubit.screens[cubit.indexx],


              fallback: (BuildContext context) {
                return Center(
                    child: CircularProgressIndicator()
                );
              },
            ),
          );
        },

      ),
    );
  }

  // Future<String> getName() async
  // {
  //   return 'Ahmed Ali';
  // }


}








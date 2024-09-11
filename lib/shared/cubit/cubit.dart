import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/shared/cubit/states.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

import '../../modules/todo_app/archieved_tasks/archieved_tasks_screen.dart';
import '../../modules/todo_app/done_tasks/done_tasks_screen.dart';
import '../../modules/todo_app/new_tasks/new_tasks_screen.dart';



class AppCubit extends Cubit<AppStates>{

  AppCubit(): super(AppInitialState());
 // static counterCubit get(context)=>BlocProvider.of(context);
  static AppCubit get(context)=>BlocProvider.of(context);
  int indexx=0;
  List<Widget>screens=[
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchievedTasksScreen(),
  ];
  List<String>titles=[
    'New Tasks',
    'Done Tasks',
    'Archieved Tasks',
  ];
  late Database database;

  List<Map> newTasks=[];
  List<Map> doneTasks=[];
  List<Map> archievedTasks=[];
  bool isButtonSheetShown = false;
  IconData fabIcon=Icons.edit;

  void changeIndex(int index)
  {
    indexx=index;
    emit(AppChangeButtomNavBarState());
  }

  void createDatabase()
  {
      openDatabase(
        'Todo.db',
        version: 1,
        onCreate: (database,version)
        {
          print("database created");
          database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)').then((value) {
            print('tabels created');
          }).catchError((error){
            print('Error when creating table ${error.toString()}');
          });
        },
        onOpen: (database)
        {
          getDataFromDatabase(database);
          print("database opened");
        }
    ).then((value) {
      database=value;
      emit(AppCreateDataBaseState());
      });
  }

   insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async
  {
    await database.transaction((txn)
    {
      return txn.rawInsert(
          'INSERT INTO tasks(title,date,time,status)VALUES("$title","$date","$time","new")').then((value)
      {
        print('$value inserted scucessfully');
        emit(AppInsertDataBaseState());
        getDataFromDatabase(database);
       // getDataFromDatabase(database);
      }).catchError((error)
      {
        print('Error when inserting new record ${error.toString()}');
      });


    });
  }

  void getDataFromDatabase(database) {

    newTasks=[];
    doneTasks=[];
    archievedTasks=[];
    //emit(AppGetDataBaseLoadingState());
     database.rawQuery('SELECT * FROM tasks').then((value) {
       // tasks=value;
       // print(tasks);

       value.forEach((element) {
         if(element['status']=='new')
           {
             newTasks.add(element);
           }
         else if(element['status']=='done')
           {
             doneTasks.add(element);
           }
         else
           {
             archievedTasks.add(element);
           }
        // print(element['status']);
       });

       emit(AppGetDataBaseState());
     });

  }

  void updateDate({required status,required id}) async
  {
     database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
          getDataFromDatabase(database);
          emit(AppUpdateDataBaseState());
     });

  }

  void changeBottomSheerState({required bool isShow,required IconData icon})
  {
    isButtonSheetShown=isShow;
    fabIcon=icon;
    emit(AppChangeButtomSheetState());
  }

  void deleteDate({required id})
  {
    database.rawDelete('DELETE FROM Tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDataBaseState());
    });

  }
  bool isDark=false;
  ThemeMode appMode=ThemeMode.dark;
  void changeAppMode({bool? fromShared}){
    if(fromShared!=null)
      {
        isDark=fromShared;
        emit(AppChangeModeState());
      }
    else
      {
        isDark=!isDark;
        CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
          emit(AppChangeModeState());
        });
      }

  }

}


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled/layout/news_app/cubit/cubit.dart';

import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/social_app/cubit/cubit.dart';
import 'package:untitled/layout/social_app/social_layout.dart';

import 'package:untitled/modules/social_app/social_login_screen/social_login_screen.dart';

import 'package:untitled/shared/bloc_observer.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/styles/themes.dart';

import 'desktop.dart';
import 'firebase_options.dart';
import 'layout/news_app/news_layout.dart';
import 'modules/native_code.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('on background message');
  print(message.data.toString());
  showToast(text: 'on background message', state: ToastStates.SUCCESS);
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   var token=await FirebaseMessaging.instance.getToken();
//   print('token is $token');
// // foreground fcm
//   FirebaseMessaging.onMessage.listen((event) {
//     print('on message');
//     print(event.data.toString());
//     showToast(text: 'on message', state: ToastStates.SUCCESS);
//   });
// // when click on notification to open app
//   FirebaseMessaging.onMessageOpenedApp.listen((event) {
//     print('on message opened app');
//     print(event.data.toString());
//     showToast(text: 'on message opened app', state: ToastStates.SUCCESS);
//
//   });
// // background fcm
//   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//
//   // await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;
 // bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

   uId=CacheHelper.getData(key: 'uId');

  if(uId!=null)
    {
      widget=SocialLayout();
    }
  else
    {
      widget=SocialLoginScreen();
    }



 // String? token = CacheHelper.getData(key: 'token');
 // print(token);

  // if(onBoarding!=null)
  //   {
  //     if(token!=null)
  //       {
  //         widget=ShopLayout();
  //       }
  //     else
  //       {
  //         widget=ShopLoginScreen();
  //       }
  //   }
  // else
  //   {
  //     widget=OnBoardingScreen();
  //   }


 // print(onBoarding);

  runApp(myApp(
    isDark:isDark,
    startWidget:widget,
  ));
}
class myApp extends StatelessWidget
{

  final bool? isDark;
  final Widget? startWidget;
  //myApp(bool bool);

  myApp({required this.isDark,required this.startWidget,});
//required this.isDark,

  @override
  Widget build(BuildContext context)
   {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSports()..getScience()),

          BlocProvider(create: (BuildContext context)=> AppCubit()..changeAppMode(fromShared: isDark)),//fromShared: isDark

          BlocProvider(create: (context)=>ShopCubit()..getHomeData()..getCategories()..getFavorates()..getUserData()),
          
          BlocProvider(create: (context)=>SocialCubit()..getUserData()..getPosts())
        ],
        child: BlocConsumer<AppCubit,AppStates>(
          listener: (context,status){},
          builder: (context,status){
            return  MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
             // themeMode: ThemeMode.light,
              home: DesktopScreen(),
            );
          },

        ),
      ),
    );

  }

}





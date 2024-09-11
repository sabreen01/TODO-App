import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/social_app/cubit/cubit.dart';
import 'package:untitled/layout/social_app/cubit/states.dart';
import 'package:untitled/modules/social_app/new_post/new_post_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){
        if (state is SocialNewPostState)
          {
            navigateTo(context, NewPostScreen());
          }
      },
      builder: (context,state){
        var cubit=SocialCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            
            title: Text(
                cubit.titles[cubit.currentIndex]
            ),
            actions: [
              IconButton(
                  onPressed: (){

                  },
                  icon: Icon(IconBroken.Notification)
              ),
              IconButton(
                  onPressed: (){

                  },
                  icon: Icon(IconBroken.Search)
              )
            ],
          ),
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Home
                  ),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                icon:
                Icon(
                    IconBroken.Chat
                ),
                  label: 'Chat'

              ),
              BottomNavigationBarItem(
                  icon:
                  Icon(
                      IconBroken.Paper_Upload
                  ),
                  label: 'Post'

              ),
              BottomNavigationBarItem(
                icon:
                Icon(
                    IconBroken.Location
                ),
                  label: 'Users'

              ),
              BottomNavigationBarItem(
                icon:
                Icon(
                    IconBroken.Setting
                ),
                  label: 'Setting'

              ),
            ],
          ),
          // body: ConditionalBuilder(
          //   condition: SocialCubit.get(context).model!=null,
          //   builder: (context){
          //    // var model=SocialCubit.get(context).model;
          //     return Column(
          //       children: [
          //
          //        // if(!model!.isEmailVerified!)
          //        //  if(!FirebaseAuth.instance.currentUser!.emailVerified)
          //        //  Container(
          //        //    color: Colors.amber.withOpacity(.6),
          //        //    //height: 50,
          //        //    child: Padding(
          //        //      padding: const EdgeInsets.symmetric(horizontal: 20),
          //        //      child: Row(
          //        //        children: [
          //        //          Icon(Icons.info_outline),
          //        //          SizedBox(
          //        //            width: 15,
          //        //          ),
          //        //          Expanded(
          //        //            child: Text(
          //        //              'please verify your email',
          //        //            ),
          //        //          ),
          //        //          // Spacer(),
          //        //          SizedBox(
          //        //            width: 20,
          //        //          ),
          //        //          defaultTextButton(
          //        //            function: (){
          //        //              FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value) {
          //        //                showToast(text: 'check your mail', state: ToastStates.SUCCESS);
          //        //              }).catchError((error){
          //        //
          //        //              });
          //        //            },
          //        //            //width: 80,
          //        //            text: 'send ',
          //        //          ),
          //        //        ],
          //        //      ),
          //        //    ),
          //        //  ),
          //       ],
          //     );
          //   },
          //   fallback: (context)=>Center(child: CircularProgressIndicator()),
          //
          // ),
        );
      },

    );
  }
}

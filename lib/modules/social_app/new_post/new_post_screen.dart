

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/social_app/cubit/cubit.dart';
import 'package:untitled/layout/social_app/cubit/states.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/icon_broken.dart';

class NewPostScreen extends StatelessWidget {

  var textController=TextEditingController();

  // @override
  // Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocialCubit,SocialStates>(

      listener: (BuildContext context, SocialStates state) {  },

      builder: (BuildContext context, SocialStates state) {
        return Scaffold(

          appBar:PreferredSize(
            preferredSize: Size.fromHeight(70),

            child:  defaultAppBar(context:context,title: 'Create Post',
                actions: [
                  TextButton(
                      onPressed: (){
                        var datetime = DateTime.now().toString();

                        if(SocialCubit.get(context).postImage==null)
                          {
                            SocialCubit.get(context).createPost(dateTime: datetime.toString(), text: textController.text);
                          }
                        else
                          {
                            SocialCubit.get(context).uploadPostImage(dateTime: datetime.toString(), text: textController.text);
                          }
                      },
                      child: Text(
                          'POST'
                      )
                  )
                ]
            ),

          ),
          body:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState)
                  LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)
                  SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage('https://img.freepik.com/free-photo/close-up-shot-pretty-woman-with-perfect-teeth-dark-clean-skin-having-rest-indoors-smiling-happily-after-received-good-positive-news_273609-1248.jpg?w=996&t=st=1694727566~exp=1694728166~hmac=0ee1beabfbd5e6b16510f35a0703695903342a02fea695342fb41a7cf2e76c02'),

                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        'Randa Sabra',
                        style: TextStyle(
                            height: 1.4
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: 'what is your mind, Randa ?',
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if(SocialCubit.get(context).postImage!=null)
                  Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image:FileImage(SocialCubit.get(context).postImage!)as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        SocialCubit.get(context).removePostImage();
                      },
                      icon: CircleAvatar(
                        radius: 20,

                        child: Icon(
                          Icons.close,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: (){
                            SocialCubit.get(context).getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(IconBroken.Image),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Add Photo'),
                            ],
                          )
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Expanded(
                      child: TextButton(
                          onPressed: (){},
                          child: Text('# tags'),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ) ,
          // body: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20),
          //       child: Row(
          //         children: [
          //           CircleAvatar(
          //             radius: 25,
          //             backgroundImage: NetworkImage('https://img.freepik.com/free-photo/close-up-shot-pretty-woman-with-perfect-teeth-dark-clean-skin-having-rest-indoors-smiling-happily-after-received-good-positive-news_273609-1248.jpg?w=996&t=st=1694727566~exp=1694728166~hmac=0ee1beabfbd5e6b16510f35a0703695903342a02fea695342fb41a7cf2e76c02'),
          //
          //           ),
          //           SizedBox(
          //             width: 15,
          //           ),
          //           Expanded(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   children: [
          //                     Text(
          //                       'Randa Sabra',
          //                       style: TextStyle(
          //                           height: 1.4
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       width: 5,
          //                     ),
          //                     // Icon(
          //                     //   Icons.check_circle,
          //                     //   color: defaultColor,
          //                     //   size: 16,
          //                     // )
          //
          //                   ],
          //                 ),
          //                 Text(
          //                   'Public',
          //                   style: Theme.of(context).textTheme.caption?.copyWith(
          //                       height: 1.4
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           SizedBox(
          //             width: 15,
          //           ),
          //           // IconButton(
          //           //   onPressed: (){
          //           //
          //           //   },
          //           //   icon: Icon(
          //           //     Icons.more_horiz,
          //           //     size: 16,
          //           //   ),
          //           // ),
          //         ],
          //       ),
          //     ),
          //     // SizedBox(
          //     //   height: 20,
          //     // ),
          //     Padding(
          //       padding: const EdgeInsets.all(20.0),
          //       child: Text(
          //         'what is on your mind ,Randa ?',
          //         style: Theme.of(context).textTheme.caption,
          //       ),
          //     ),
          //     Spacer(),
          //     Padding(
          //       padding: const EdgeInsets.all(20.0),
          //       child: Row(
          //         children: [
          //           Expanded(
          //             child: TextButton(
          //                 onPressed: (){},
          //                 child: Text(
          //                   'Add photo'
          //                 )
          //             ),
          //           ),
          //
          //           Expanded(
          //             child: TextButton(
          //                 onPressed: (){},
          //                 child: Text(
          //                     '# tag'
          //                 )
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        );
      },

    );
  }


}

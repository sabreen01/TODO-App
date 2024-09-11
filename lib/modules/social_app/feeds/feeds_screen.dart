
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/social_app/cubit/cubit.dart';
import 'package:untitled/layout/social_app/cubit/states.dart';
import 'package:untitled/models/social_app/post_model.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';
import 'package:untitled/shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return ConditionalBuilder(
          condition: SocialCubit.get(context).posts.length>0&&SocialCubit.get(context).userModel!=null,
          builder:(context)=> SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5,
                  margin: EdgeInsetsDirectional.all(8),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image(
                        image: NetworkImage('https://img.freepik.com/free-photo/portrait-young-ginger-woman_273609-11672.jpg?w=996&t=st=1694725190~exp=1694725790~hmac=0f39b340df84b2d82e2304b0ed671bdfae9e4060e321770c260b35f44d2e11c0'),
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'communicate with friends',
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: Colors.black
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=>buildPostItem(SocialCubit.get(context).posts[index],context,index),
                  itemCount: SocialCubit.get(context).posts.length,
                  separatorBuilder: (context,index){
                    return SizedBox(
                      height:8,
                    );
                  },
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()) ,


        );
      },

    );
  }
  Widget buildPostItem(PostModel model,context,index)
  {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('${model.image}'),

                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${model.name}',
                            style: TextStyle(
                                height: 1.4
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: defaultColor,
                            size: 16,
                          )

                        ],
                      ),
                      Text(
                        '${model.dateTime}',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            height: 1.4
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: (){

                  },
                  icon: Icon(
                    Icons.more_horiz,
                    size: 16,
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            Text(
              '${model.text}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            // SizedBox(
            //   height: 15,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //       bottom: 10,
            //       top: 5
            //   ),
            //   child: Container(
            //     // color: Colors.red,
            //     width: double.infinity,
            //     child: Wrap(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsetsDirectional.only(
            //               end: 6
            //           ),
            //           child: Container(
            //             height: 25,
            //             child: MaterialButton(
            //               onPressed: (){},
            //               minWidth: 1,
            //
            //               // color: Colors.blue,
            //               padding: EdgeInsets.zero,
            //               child: Text(
            //                 '#software',
            //                 style: Theme.of(context).textTheme.caption?.copyWith(
            //                     color: defaultColor
            //                 ),
            //               ),
            //             ),
            //           ),
            //
            //         ),
            //
            //
            //       ],
            //     ),
            //   ),
            // ),
            if(model.postImage!='')
             Padding(
              padding: const EdgeInsets.only(
                top: 15
              ),
              child: Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: NetworkImage('${model.postImage}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 5
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5
                        ),
                        child: Row(
                          children: [
                            Icon(
                              IconBroken.Heart,
                              size: 16,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                            //  '0',
                              '${SocialCubit.get(context).likes[index]}',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){

                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              IconBroken.Chat,
                              size: 16,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '0 comment',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){

                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10
              ),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage('${SocialCubit.get(context).userModel?.image}'),

                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Write a comment',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                            // height: 1.4
                          ),
                        ),
                      ],
                    ),
                    onTap: ()
                    {

                    },
                  ),
                ),
                InkWell(

                  child: Row(
                    children: [
                      Icon(
                        IconBroken.Heart,
                        size: 16,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Like',

                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: (){
                    SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
                  },
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

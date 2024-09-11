
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/social_app/cubit/cubit.dart';
import 'package:untitled/layout/social_app/cubit/states.dart';
import 'package:untitled/models/social_app/social_user_model.dart';
import 'package:untitled/modules/social_app/chats/chat_details/chat_details_screen.dart';
import 'package:untitled/shared/components/components.dart';

class ChatsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(

      listener: (BuildContext context, SocialStates state) {  },
      builder: (BuildContext context, SocialStates state) {
        return ConditionalBuilder(

          condition: SocialCubit.get(context).users.length>0,
          builder: (BuildContext context) {
            return  ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildChatItem(SocialCubit.get(context).users[index],context),
                separatorBuilder:(context,index)=> myDivider(),
                itemCount: SocialCubit.get(context).users.length
            );
          },
          fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),

        );
      },

    );
  }

  Widget buildChatItem(SocialUserModel model,context){
    return InkWell(
      onTap: (){
        navigateTo(context, ChatDetailsScreen(userModel: model,));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('${model.image}'),

            ),
            SizedBox(
              width: 15,
            ),
            Text(
              '${model.name}',
              style: TextStyle(
                  height: 1.4
              ),
            ),
          ],
        ),
      ),
    );
  }
}
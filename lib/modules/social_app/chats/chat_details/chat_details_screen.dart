import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/social_app/social_user_model.dart';
import 'package:untitled/shared/styles/colors.dart';

class ChatDetailsScreen extends StatelessWidget {

  SocialUserModel? userModel;
  ChatDetailsScreen({this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('${userModel?.image}'),
            ),
            SizedBox(
              width: 15,
            ),
            Text('${userModel?.name}'),
          ],
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10),
                    bottomStart:Radius.circular(10) ,
                    topStart: Radius.circular(10),
                    topEnd: Radius.circular(10)
                  ),
                ),
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                    'Hello World'
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                decoration: BoxDecoration(
                  color: defaultColor.withOpacity(.2),//Colors.grey[300],
                  borderRadius: BorderRadiusDirectional.only(
                    //  bottomEnd: Radius.circular(10),
                      bottomStart:Radius.circular(10) ,
                      topStart: Radius.circular(10),
                      topEnd: Radius.circular(10)
                  ),
                ),
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                    'Hello World'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/social_app/social_user_model.dart';
import 'package:untitled/shared/styles/colors.dart';

import '../../../shared/styles/icon_broken.dart';

class UserScreen extends StatelessWidget {

  SocialUserModel? userModel;
  UserScreen({this.userModel});

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
                    //  bottomStart:Radius.circular(10) ,
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
            Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadiusDirectional.circular(15),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'type your message here...'
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    color: defaultColor,
                    child: MaterialButton(
                        onPressed: (){},
                        minWidth: 1,
                        child: Icon(
                            IconBroken.Send,
                            size: 16,
                          color: Colors.white,
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

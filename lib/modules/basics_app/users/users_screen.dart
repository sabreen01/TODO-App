import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/user/user_model.dart';





class UsersScreen extends StatelessWidget {
  List<UserModel>users=[
    UserModel(
      id: 1,
      name: "Randa",
      phone: "012457812",
    ),
    UserModel(
      id: 2,
      name: "Noor",
      phone: "015421548",
    ),
    UserModel(
      id: 3,
      name: "Ali",
      phone: "01021548639",
    ),
    UserModel(
      id: 1,
      name: "Randa",
      phone: "012457812",
    ),
    UserModel(
      id: 2,
      name: "Noor",
      phone: "015421548",
    ),
    UserModel(
      id: 3,
      name: "Ali",
      phone: "01021548639",
    ),
    UserModel(
      id: 1,
      name: "Randa",
      phone: "012457812",
    ),
    UserModel(
      id: 2,
      name: "Noor",
      phone: "015421548",
    ),
    UserModel(
      id: 3,
      name: "Ali",
      phone: "01021548639",
    ),
    UserModel(
      id: 1,
      name: "Randa",
      phone: "012457812",
    ),
    UserModel(
      id: 2,
      name: "Noor",
      phone: "015421548",
    ),
    UserModel(
      id: 3,
      name: "Ali",
      phone: "01021548639",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body:ListView.separated(
          itemBuilder: (context,index)=>buildUserItem(users[index]),
          separatorBuilder: (context,index)=>Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
            ),
            child: Container(
              width: double.infinity,
              height:1,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
      )
    ) ;
  }
  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
                //   fontSize: 25,
                //   fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


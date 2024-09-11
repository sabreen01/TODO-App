import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

import '../../../models/shop_app/categories_model.dart';

class CategoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (BuildContext context, ShopStates state) {  },
      builder: (BuildContext context, ShopStates state) {
        return ListView.separated(
          // scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
            itemBuilder: (context,index)=>buildCatItem(ShopCubit.get(context).categoriesModel!.data!.data![index]),
            separatorBuilder:(context,index)=>myDivider(),
            itemCount: ShopCubit.get(context).categoriesModel!.data!.data!.length
        );
      },

    );
  }

  Widget buildCatItem(DataModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage('${model.image}'),
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          '${model.name}',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios)
      ],
    ),
  );

}
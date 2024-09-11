import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/shop_app/favorates_model.dart';

import '../../../layout/shop_app/cubit/cubit.dart';
import '../../../layout/shop_app/cubit/states.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';

class FavourateScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<ShopCubit,ShopStates>(

      listener: (BuildContext context, ShopStates state) {  },
      builder: (BuildContext context, ShopStates state) {
        return ConditionalBuilder(

          condition: state is! ShopLoadingGetFavoratesState,
          builder: (BuildContext context) {
            return  ListView.separated(

              itemBuilder: (context,index)=>buildListProduct(ShopCubit.get(context).favoratesModel!.data!.data![index].product!,context),
              separatorBuilder:(context,index)=>myDivider(),
              itemCount: ShopCubit.get(context).favoratesModel?.data!.data!.length??0,
            );
          },
          fallback: (BuildContext context) {
            return Center(child: CircularProgressIndicator());
          },

        );
      },

    );
  }


}
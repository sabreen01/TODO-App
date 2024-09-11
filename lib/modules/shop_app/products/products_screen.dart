

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/models/shop_app/categories_model.dart';
import 'package:untitled/models/shop_app/home_model.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        listener: (BuildContext context, ShopStates state) {
          if(state is ShopSuccessChangeFavoratesState)
            {
              if(!state.model.status!)
                {
                  showToast(text: state.model.message!, state: ToastStates.ERROR);
                }
            }
        },
        builder: (BuildContext context, ShopStates state) {
          return ConditionalBuilder(

            condition: ShopCubit.get(context).homeModel!=null&&ShopCubit.get(context).categoriesModel!=null,

            builder: (BuildContext context) {
              return builderWidget(ShopCubit.get(context).homeModel!,ShopCubit.get(context).categoriesModel!,context);
            },
            fallback: (BuildContext context) {
              return Center(child: CircularProgressIndicator());
            },

          );
        },
    );
  }

  Widget builderWidget(HomeModel? model,CategoriesModel categoriesModel,context)
  {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              items:model?.data?.banners?.map((e) => Image(
                image: NetworkImage(
                    '${e?.image}'
                ),
                width: double.infinity,
                fit: BoxFit.cover,

              ),).toList() ,
              options: CarouselOptions(
                height: 250,
                initialPage: 0,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(
                  seconds: 3
                ),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal
              )
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                     // shrinkWrap: true,
                      itemBuilder: (context,index)=>buildCategoryItem(categoriesModel!.data!.data![index]),
                      separatorBuilder:(context,index)=>SizedBox(width: 10,) ,
                      itemCount: categoriesModel.data!.data!.length,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'New Products',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 1/1.58,
                children:List.generate(model!.data!.products!.length, (index) =>
                     buildGridProduct(model.data!.products![index]!,context)
                 ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCategoryItem(DataModel model)
  {
    return  Stack(
      alignment:AlignmentDirectional.bottomCenter ,
      children: [
        Image(
          image: NetworkImage('${model.image}'),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(.8),
          width:100,
          child: Text(
            '${model.name}',
            textAlign:TextAlign.center ,
            maxLines: 1,
            overflow:TextOverflow.ellipsis ,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildGridProduct(productModel model,context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage('${model.image}'),
                width: double.infinity,
                height: 200,
               // fit: BoxFit.cover,
              ),
              if(model.discounts!=0)
              Container(
               // height: 15,
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'DISCOUNT',
                  //  textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,

                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.3
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${model.price.round()}',


                       style: TextStyle(
                           fontSize: 12,
                           color: defaultColor
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if(model.discounts!=0)
                      Text(
                        '${model.oldPrice.round()}',


                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                      
                        onPressed: (){
                          ShopCubit.get(context).changeFavorates(model.id);
                        },
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor:ShopCubit.get(context).favourate[model.id]! ? defaultColor:Colors.grey ,
                          child: Icon(
                              Icons.favorite_border,
                              size: 14,
                              color: Colors.white,
                          ),
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}



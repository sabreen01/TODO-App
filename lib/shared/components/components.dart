

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:untitled/shared/cubit/cubit.dart';

import '../../layout/shop_app/cubit/cubit.dart';
import '../../modules/news_app/webview/webview_screen.dart';
import '../styles/colors.dart';
import '../styles/icon_broken.dart';

Widget defaultButton({
   double width=double.infinity,
   Color background=Colors.blue,
  bool isUpperCase=true,
  double radius=10,
  required void Function() function,
  required String text,
}) =>
    Container(
  width: width,

   height: 40,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase?text.toUpperCase():text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
   // height: 40,
  ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  var onSubmit,
  var onChange,
  var pressed,
  required var validate,
  required String lable,
  required IconData prefix,
  IconData? sufix,
  bool isPassword=false,
  bool isClickable=true,
  void Function()? onTap,
}) {

  return TextFormField(

  controller: controller,
  keyboardType: type ,
  onFieldSubmitted:onSubmit,
  // {
  //   onSubmit!();
  // },
  onChanged: onChange,
  validator: validate,
  onTap:onTap ,
  enabled:isClickable ,
  obscureText:isPassword,
  decoration: InputDecoration(
    labelText: lable,

    border: OutlineInputBorder(),
    prefixIcon: Icon(prefix),
    suffixIcon:sufix!=null ? IconButton
      (
        onPressed: pressed,
        icon: Icon(sufix)):null,
  ),
);
}

Widget buildTaskItem(Map model,context){
  return Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            child: Text(
              '${model['time']}',
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${model['title']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  //textAlign: TextAlign.end,
                ),
                Text(
                  '${model['date']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: (){
                AppCubit.get(context).updateDate(status: 'done', id: model['id']);
              },
              icon:Icon(
                  Icons.check_box,
                  color: Colors.green,
              ) ,
          ),
          IconButton(
            onPressed: (){
              AppCubit.get(context).updateDate(status: 'archieved', id: model['id']);
            },
            icon:Icon(
                Icons.archive,
                color: Colors.black45,
            ) ,
          )

        ],
      ),
    ),
    onDismissed: (Direction){
      AppCubit.get(context).deleteDate( id: model['id']);
    },
  );
}

Widget tasksBuilder({
  required List<Map>tasks,
})
{
  return  ConditionalBuilder(
    condition: tasks.length>0,
    builder: (context){
      return ListView.separated(
        itemBuilder: (context,index){
          return buildTaskItem(
            tasks[index],
            context,
          );
        },
        separatorBuilder: (context,index){
          return Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
            ),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          );
        },
        itemCount: tasks.length,
      );
    },
    fallback: (context){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.menu,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet, Please add some tasks',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

          ],
        ),
      );
    },
  );
}

Widget myDivider()
{
  return Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 20,
    ),
    child: Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[300],
    ),
  );
}

Widget buildArticleItem(article,context)
{
  return InkWell(
    onTap: (){
      navigateTo(context, WebViewScreen(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            // color: Colors.red,
            decoration: BoxDecoration(
              //  color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    '${article['urlToImage']}'
                  ),
                  fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(

                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                      // fontSize: 18,
                      // fontWeight: FontWeight.w600
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget articleBuilder(list,context,{isSearch=false})
{
  return  ConditionalBuilder(
    condition: list.length>0,
    builder:(context) {
      return ListView.separated(
        itemBuilder:(context,index) => buildArticleItem(list[index],context),
        separatorBuilder:(context,index)=> myDivider(),
        itemCount: 10,
        physics: BouncingScrollPhysics(),
      );
    } ,
    fallback:(context)=>isSearch?Container():Center(child: CircularProgressIndicator()),

  );
}

void navigateTo(context,widget) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context)
        =>widget
    )
);

void navigateAndFinish(context,widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
        builder: (context) =>widget
    ),
    (route)=>false
);

Widget defaultTextButton({
  required void Function() function,
  required String text,
}){
  return TextButton(onPressed: function, child:Text(text.toUpperCase()) );
}

void showToast({
  required String text,
  required ToastStates state,
})
{
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: ChooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastStates{SUCCESS,ERROR,WARNING}

Color ChooseToastColor(ToastStates state)
{
  Color color;
  switch(state)
      {
    case ToastStates.SUCCESS:
      color=Colors.green;
      break;
    case ToastStates.ERROR:
      color= Colors.red;
      break;
    case ToastStates.WARNING:
      color= Colors.amber;
      break;
  }
  return color;
}

Widget buildListProduct(model, context,{bool isOldPrice=true})=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120,
    child: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage('${model.image}'),
              width: 120,
              height: 120,
              // fit: BoxFit.cover,
            ),
            if(model.discount!=0&&isOldPrice)
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
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.name!}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    height: 1.3
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    '${model.price.toString()!}',


                    style: TextStyle(
                        fontSize: 12,
                        color: defaultColor
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if(model.discount!=0&&isOldPrice)
                    Text(
                      '${model.oldPrice.toString()!}',


                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Spacer(),
                  IconButton(

                    onPressed: (){
                      ShopCubit.get(context).changeFavorates(model.id!);
                    },
                    icon: CircleAvatar(
                      radius: 15,
                      backgroundColor:ShopCubit.get(context).favourate[model.id]!? defaultColor:Colors.grey ,
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
  ),
);

Widget defaultAppBar({
    required BuildContext context,
    String? title,
    List<Widget>? actions,
}){

  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(IconBroken.Arrow___Left_2),
    ),
    titleSpacing: 5,
    title: Text(
        title!
    ),
    actions: actions
  );
}

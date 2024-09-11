import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';

class SettingsScreen extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(

      listener: (BuildContext context, ShopStates state) {},

      builder: (BuildContext context, ShopStates state) {
        var model=ShopCubit.get(context).userModel!;
         nameController.text=model!.data!.name! ;
         emailController.text=model!.data!.email!;
         phoneController.text=model!.data!.phone!;

        return  ConditionalBuilder(

          condition: ShopCubit.get(context).userModel!=null,

          builder: (BuildContext context)  => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if(state is ShopLoadingUpdateUserState)
                  LinearProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    controller:nameController,
                    type: TextInputType.name,
                    validate: (value)
                    {
                      if(value.isEmpty!)
                      {
                        return 'name must not be empty';
                      }
                      return null;
                    },
                    lable: 'Name',
                    prefix: Icons.person,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  defaultFormField(
                    controller:emailController,
                    type: TextInputType.emailAddress,
                    validate: (value)
                    {
                      if(value.isEmpty!)
                      {
                        return 'email must not be empty';
                      }
                      return null;
                    },
                    lable: 'Email Address',
                    prefix: Icons.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  defaultFormField(
                    controller:phoneController,
                    type: TextInputType.phone,
                    validate: (value)
                    {
                      if(value.isEmpty!)
                      {
                        return 'phone must not be empty';
                      }
                      return null;
                    },
                    lable: 'Phone',
                    prefix: Icons.phone,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      function: (){
                        signOut(context);
                  },
                      text: 'Logout'
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      function: (){
                        if(formKey.currentState!.validate())
                          {
                            ShopCubit.get(context).UpdateUserData(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text
                            );
                          }


                      },
                      text: 'update'
                  )
                ],
              ),
            ),
          ),

          fallback: (BuildContext context) =>Center(child: CircularProgressIndicator()),

        );
      },

    );
  }
}
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/shop_app/register/cubit/cubit.dart';
import 'package:untitled/modules/shop_app/register/cubit/states.dart';

import '../../../layout/shop_app/shop_layout.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cache_helper.dart';


class ShopRegisterScreen extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var passwordController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
        listener: (context,state){
          if(state is ShopRegisterSuccessState)
          {
            if (state.loginModel.status!)
            {
              print(state.loginModel.message);
              print(state.loginModel.data?.token);
              CacheHelper.saveData(key: 'token', value: state.loginModel.data?.token).then((value) {
                token= state.loginModel.data!.token!;
                navigateAndFinish(context, ShopLayout());
              });
            }
            else
            {
              print(state.loginModel.message);
              showToast(text: state!.loginModel!.message!, state: ToastStates.ERROR);
            }
          }
        },
        builder:  (context,state){
          return Scaffold(
            appBar: AppBar(),
            body:  Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'register now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'name should not be empty';
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
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'email should not be empty';
                            }
                            return null;
                          },
                          lable: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'password should not be empty';
                            }
                            return null;
                          },
                          lable: 'Password',
                          prefix: Icons.lock_outline,
                          sufix: ShopRegisterCubit.get(context).suffix,
                          onTap:(){
                            ShopRegisterCubit.get(context).changePasswordVisibility();
                          },
                          onSubmit: (value){

                          },
                          isPassword: ShopRegisterCubit.get(context).isPassword,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'phone should not be empty';
                            }
                            return null;
                          },
                          lable: 'Phone',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(

                          condition: state is! ShopRegisterLoadingState,
                          builder: (BuildContext context) {
                            return  defaultButton(
                              function:(){
                                if(formKey.currentState!.validate())
                                {
                                  ShopRegisterCubit.get(context).userRegister(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                      phone: phoneController.text,

                                  );
                                }
                              },
                              text: 'register',
                              isUpperCase: true,
                            );
                          },
                          fallback: (BuildContext context) {
                            return Center(child: CircularProgressIndicator());
                          },

                        ),
                        // SizedBox(
                        //   height: 15,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //         'Don\'t have an account ?'
                        //     ),
                        //     defaultTextButton(
                        //         function: (){
                        //           navigateTo(context,ShopRegisterScreen() );
                        //         },
                        //         text: 'Register now'
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}

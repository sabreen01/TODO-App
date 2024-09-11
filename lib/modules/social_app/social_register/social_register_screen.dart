import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/social_app/social_layout.dart';

import '../../../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialRegisterScreen extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var passwordController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit,SocialRegisterStates>(
        listener: (context,state) {
          if (state is SocialCreateUserSuccessState)
          {
            navigateAndFinish(context, SocialLayout());
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
                          'register now to communicate with friends',
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
                          sufix: SocialRegisterCubit.get(context).suffix,
                          onTap:(){
                            SocialRegisterCubit.get(context).changePasswordVisibility();
                          },
                          onSubmit: (value){

                          },
                          isPassword: SocialRegisterCubit.get(context).isPassword,
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

                          condition: state is! SocialRegisterLoadingState,
                          builder: (BuildContext context) {
                            return  defaultButton(
                              function:(){
                                if(formKey.currentState!.validate())
                                {
                                  SocialRegisterCubit.get(context).userRegister(
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

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/social_app/social_layout.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../social_register/social_register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class SocialLoginScreen extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) =>SocialLoginCubit(),

      child: BlocConsumer<SocialLoginCubit,SocialLoginStates>(

        listener: (BuildContext context, state) {
          if(state is SocialLoginErrorState)
            {
              showToast(text: state.error, state: ToastStates.ERROR);
            }
          if(state is SocialLoginSuccessState)
            {
              CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              //  uId= state.uId;
                navigateAndFinish(context,SocialLayout());
              });
            }
        },

        builder: (BuildContext context, Object? state) {
          return Scaffold(

            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'login now to communicate with friends',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30,
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
                          sufix: SocialLoginCubit.get(context).suffix,
                          onTap:(){
                            SocialLoginCubit.get(context).changePasswordVisibility();
                          },
                          onSubmit: (value){
                            if(formKey.currentState!.validate())
                            {
                              SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text

                              );
                            }
                          },
                          isPassword: SocialLoginCubit.get(context).isPassword,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(

                          condition: state is! SocialLoginLoadingState,
                          builder: (BuildContext context) {
                            return  defaultButton(
                              function:(){
                                if(formKey.currentState!.validate())
                                {
                                  // SocialLoginCubit.get(context).userLogin(
                                  //     email: emailController.text,
                                  //     password: passwordController.text
                                  // );
                                }
                              },
                              text: 'Login',
                              isUpperCase: true,
                            );
                          },
                          fallback: (BuildContext context) {
                            return Center(child: CircularProgressIndicator());
                          },

                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Don\'t have an account ?'
                            ),
                            defaultTextButton(
                                function: (){
                                  navigateTo(context,SocialRegisterScreen() );
                                },
                                text: 'Register now'
                            ),
                          ],
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

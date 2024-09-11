import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController=TextEditingController();

  var passwordController=TextEditingController();
  bool isPassword=true;
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
               // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                   // textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
              defaultFormField(
                controller: emailController,
                prefix: Icons.email,
                lable: 'Email Address',
                type: TextInputType.emailAddress,
                validate: (value)
                {
                  if(value!.isEmpty){
                    return 'email must not be empty';
                  }
                  return null;
                },
              ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    type:TextInputType.visiblePassword,
                    isPassword: isPassword,
                    validate: (value){
                      if(value!.isEmpty)
                      {
                        return 'password must be not empty';
                      }
                      return null;
                    },

                      lable: "Password",

                      prefix: Icons.lock,
                      sufix: !isPassword? Icons.visibility:Icons.visibility_off,
                      pressed: ()
                      {
                        setState(() {
                          isPassword=!isPassword;
                        });
                      }
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    text: 'login',
                    background: Colors.blue,
                   // radius: 5.0,
                    isUpperCase: true,
                    function: () {
                      if(formKey.currentState!.validate())
                        {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don\'t have an account?",
                      ),
                      TextButton(
                          onPressed: (){},
                          child:Text (
                            "Register now",
                          )
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/shop_app/search/cubit/cubit.dart';
import 'package:untitled/modules/shop_app/search/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

class SearchsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var formKey=GlobalKey<FormState>();
    var searchController=TextEditingController();

    return BlocProvider(
      create: (BuildContext context) =>SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                        controller: searchController,
                        type: TextInputType.text,
                        validate:(value){
                          if(value.isEmpty)
                            {
                              return 'error text to search';
                            }
                          return null;
                        },
                        onSubmit: (text){
                          SearchCubit.get(context).search(text: text);
                        },
                        lable: 'search',
                        prefix: Icons.search
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if(state is SearchLoadingState)
                    LinearProgressIndicator(),
                    SizedBox(
                      height: 10,
                     ),
                    if(state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(

              itemBuilder: (context,index)=>buildListProduct(SearchCubit.get(context).model!.data!.data![index],context,isOldPrice: false),
              separatorBuilder:(context,index)=>myDivider(),
              itemCount: SearchCubit.get(context).model!.data!.data!.length??0,
            ),
                    )
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
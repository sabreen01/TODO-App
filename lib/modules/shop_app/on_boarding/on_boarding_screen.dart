import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/modules/shop_app/login/shop_login_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

import '../../../shared/styles/colors.dart';

class BoardingModel{
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image,required this.title,required this.body});

}

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel>boarding=[
    BoardingModel(
        image: 'assets/images/on_board1.jpeg',
        title: 'On Board 1 Title',
        body: 'On Board 1 Body',
    ),
    BoardingModel(
      image: 'assets/images/on_board1.jpeg',
      title: 'On Board 2 Title',
      body: 'On Board 2 Body',
    ),
    BoardingModel(
      image: 'assets/images/on_board1.jpeg',
      title: 'On Board 3 Title',
      body: 'On Board 3 Body',
    ),
  ];
  bool isLast = false;

  var BoardController=PageController();
  void submit()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value)
        {
          navigateAndFinish(context, ShopLoginScreen());
        }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
              function: submit,
              text:(
                'SKIP'
              ),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                controller: BoardController,
                onPageChanged: (int index){
                  if(index==boarding.length-1)
                    {
                      setState(() {
                        isLast=true;
                      });
                      print('last');
                    }
                  else
                    {
                      print('not last');
                      setState(() {
                        isLast=false;
                      });
                    }
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: BoardController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                      activeDotColor: defaultColor
                    ),
                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: (){
                      if(isLast)
                        {
                          submit();
                        }
                      else{
                        BoardController.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn
                        );
                      }

                    },
                    child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    //mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
          fit: BoxFit.contain,
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}

//https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=e1a00d07c8aa4328affc11faa3c772b6
//baseUrl:https://newsapi.org/
//method(url):v2/top-headlines?
//query:country=us&category=science&apiKey=e1a00d07c8aa4328affc11faa3c772b6

//search
//https://newsapi.org/v2/everything?q=tesla&apiKey=e1a00d07c8aa4328affc11faa3c772b6


import '../../modules/shop_app/login/shop_login_screen.dart';
import '../network/local/cache_helper.dart';
import 'components.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
      navigateAndFinish(context, ShopLoginScreen());
    }
  });
}

String token='';
String? uId;

abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsButtomNavState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSeccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
   final String error;
   NewsGetBusinessErrorState(this.error);

}

class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetSportsSeccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
   final String error;
   NewsGetSportsErrorState(this.error);

}

class NewsGetScienceLoadingState extends NewsStates{}

class NewsGetScienceSeccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
   final String error;
   NewsGetScienceErrorState(this.error);

}

class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetSearchSeccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
   final String error;
   NewsGetSearchErrorState(this.error);

}
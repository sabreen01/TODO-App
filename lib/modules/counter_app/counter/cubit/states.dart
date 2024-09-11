

abstract class counterStates {}

class counterInitiateState extends counterStates{}

class counterPlusState extends counterStates{
  final int counter;

  counterPlusState(this.counter);
}

class counterMunisState extends counterStates{

  final int counter;
  counterMunisState(this.counter);
}

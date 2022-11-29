import 'dart:io';

void main() {
  doThis();
}

void doThis() {
  Task1();
  Task2();
  Task3();
}

void Task1() {
  String str1 = "task1 done";
  print(str1);
}

void Task2() {
  Duration duration = Duration(seconds: 5);
  //sleep is synchronous
  // sleep(duration);

  //future is asynchronous
  //so this is asynchronous programming
  Future.delayed(duration, () {
    String str2 = "task2 done";
    print(str2);
  });
}

void Task3() {
  String str3 = "task3 done";
  print(str3);
}

//but what if next task need some help or data from the previous task ????
// go to example 2

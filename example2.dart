//when next task need some data from the previous task but previous task gonna take some time to complete.
//after null safety ' our task cant be completed with null have to fix it or make our task wait '

void main() {
  doThis();
}

void doThis() async {
  Task1();
  String str = await Task2();
  Task3(str);
}

void Task1() {
  String str1 = "task1 done";
  print(str1);
}

Future<String> Task2() async {
  Duration duration = Duration(seconds: 5);

  String result = "null";

  await Future.delayed(duration, () {
    result = "task2 done";
    print(result);
  });

  return result;
}

void Task3(String str) {
  // ignore: prefer_interpolation_to_compose_strings
  String str3 = "task3 done" + str;
  print(str3);
}

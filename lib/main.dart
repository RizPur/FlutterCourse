import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

String getFullName(String firstName, String lastName){
  return '$firstName $lastName';
} //test2

void test3(){
  var names = {'age', 'bar', 'baz'};
  names.add('foo'); 
  var person = {
    "name": "Joel Brown",
    "age": 25
  };

  person["age"] = 26;
  // print(names);
  const things = {'foo', 1};
  print(things);
}

void test5(String? firstName, String? lastName, List<String>? names){
  const String? name = null;
  print(name);

  firstName ??= "NoName";
  print(firstName);
  List<String?>? names = ['Foo', 'Boo', null]; //list of strings Names can be null and can contain strings who can be null
  final numberOfNames = names?.length ?? 0;//conditional invocation seeing that names can be null and if it is then = 0
  print(numberOfNames);

}

 
// abstract class Person { // abstract classes cannot be instantioated 
class Person {
  final String name;
  final String role;

  Person(this.name, this.role);

  factory Person.fromRole(String role) {
    if (role == 'student') {
      return Student('Student Name');
    } else if (role == 'teacher') {
      return Teacher('Teacher Name');
    }
    return Person('Default Name', role);
  }

  @override
  bool operator == (covariant Person other) => other.name == name;
  //In this class, the == operator is overridden to compare Person objects based on their name field

  @override
  int get hashCode => name.hashCode;
  //When you override ==, it's important to also override the hashCode getter to maintain consistency. This is because objects that are equal (according to ==) should also have the same hash code. This is crucial for using these objects in collections like sets or maps.

  void breathe() {
    print("$name breathes");
  }

  void run() {
    print("$name runs");
  }
}

class Student extends Person {
  Student(String name) : super(name, 'student');
}

class Teacher extends Person {
  Teacher(String name) : super(name, 'teacher');
}

enum AnimalType {cat, dog, rabbit}

void test6(AnimalType animalType){
  print(animalType);
  switch (animalType) {
    case AnimalType.dog:
      print("Dog");
      break;
    case AnimalType.cat:
      print("cat");
      break;
    default:
      print("either rabbit or nothing");
      return;
  }
  print("Function is finished");

  final person = Person("Baz", "student");
  person.run();

  final student = Student("Jas");
  student.breathe();

  final maas =  Person.fromRole("g");
  final maas2 = Person.fromRole("f");
  print(maas.name);

  maas == maas2 ? print("They are equal") : print("They aren't equal");
}


extension Writes on Teacher { //extensions add functionalities to Class without adding to the class itself
  void write(){
    print('Teacher $name is writing');
  }
}

class Child {
  final String firstName;
  final String lastName;

  Child(this.firstName, this.lastName);
}

extension FullName on Child {
  String get fullName => '$firstName $lastName'; //getter 
}

Future<int> heavyFutureTimes2(int a){ // Future represents a potential value (or error) that will be available at some time in the future
  return Future.delayed(const Duration(seconds: 2), () => a*2);
}

Future<double> heavyFutureDivides2(int a){
  return Future.delayed(const Duration(seconds: 4), ()=>a/2);
}

void test7() async{
  final child = Child("Foo", "Bar");
  print(child.fullName); //extension

  // final result = await heavyFutureTimes2(10); // if no await then it returns the Future itself
  // print(result);
  final result = await Future.wait([heavyFutureTimes2(2), heavyFutureDivides2(2)]); //If you have multiple independent Futures and you want to wait for all of them to complete, you can use Future.wait:
  print('Results: ${result[0]} and ${result[1]}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print(getFullName('foo', 'bar'));
    // test5(null, null, ['Test']);
    // test6(AnimalType.cat);
    test7();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

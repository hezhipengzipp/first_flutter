import 'package:english_words/english_words.dart';
import 'package:first_flutter/AnimationTestRoute.dart';
import 'package:first_flutter/CustomScrollViewRoute.dart';
import 'package:first_flutter/FormTestRoute.dart';
import 'package:first_flutter/NewRoute.dart';
import 'package:first_flutter/statusData/StatusDataManager.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'AnimatedListRoute.dart';
import 'AnimationRoute.dart';
import 'AsyncClife.dart';
import 'FlexLayoutTestRoute.dart';
import 'FutureRoute.dart';
import 'GetStorageRoute.dart';
import 'GridViewRoute.dart';
import 'ListViewPage.dart';
import 'PageViewRoute.dart';
import 'StackRoute.dart';
import 'TabViewRoute.dart';
import 'TapBoxA.dart';
import 'WillPopScopeTestRoute.dart';
import 'combination/GradientPage.dart';
import 'generateImage/generateImage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      routes: {
        "new_page": (context) => const NewRoute(),
        "form_route": (context) => const FormTestRoute(),
        "flex_route": (context) => const FlexLayoutTestRoute(),
        "listview_route": (context) => const ListViewPage(),
        "animated_route": (context) => const AnimatedListRoute(),
        "gridview_route": (context) => const GrideViewRoute(),
        "pageview_route": (context) => const PageViewRoute(),
        "status_data_manager_route": (context) => const StatusDataManager(),
        "tabview_route": (context) => const TabViewRoute(),
        "gradient_route": (context) => const GradientPage(),
        "custom_scroll_route": (context) => const CustomScrollViewRoute(),
        "async_clife_route": (context) => const AsyncClifeRoute(),
        "get_storage_route": (context) => const GetStorageRoute(),
        "transition_route": (context) => const TransitionsHomePage(),
        "popscope_route": (context) => const WillPopScopeTestRoute(),
        "Future_build_route": (context) => const FutureRoute(),
        "stack_route": (context) => const StackRoutePage(),
        "AnimationScale_route": (context) => const AnimationTestRoute(),
        "Generate_Image_route": (context) => const GenerateImageRoute(),
      },
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
    var wordPair = WordPair.random();
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
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
              const TapboxA(),
              Text('随机英文：${wordPair.toString()}'),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "form_route");
                  },
                  child: const Text('form_route')),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "new_page",
                        arguments: {"Android": "nice"});
                  },
                  child: const Text('open new_page')),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("flex_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "flex_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("Generate_Image_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "Generate_Image_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("List_view"),
                onPressed: () {
                  Navigator.pushNamed(context, "listview_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("animated_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "animated_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("gradient_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "gradient_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("gridview_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "gridview_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("AnimationScale_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "AnimationScale_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("status_data_manager_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "status_data_manager_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("pageview_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "pageview_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("tabview_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "tabview_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("custom_scroll_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "custom_scroll_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("async_clife_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "async_clife_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("get_storage_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "get_storage_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("transition_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "transition_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("popscope_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "popscope_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("stack_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "stack_route");
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("Future_build_route"),
                onPressed: () {
                  Navigator.pushNamed(context, "Future_build_route");
                },
              ),
              Container(
                  margin: const EdgeInsets.only(top: 40, left: 50),
                  constraints:
                      const BoxConstraints.tightFor(width: 200, height: 150),
                  decoration: BoxDecoration(
                      gradient: const RadialGradient(
                          colors: [Colors.red, Colors.orange],
                          center: Alignment.topLeft),
                      borderRadius: BorderRadius.circular(3.0),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0)
                      ]),
                  transform: Matrix4.rotationZ(.2),
                  alignment: Alignment.center,
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    debugPrint("initState");
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    debugPrint("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies");
  }
}

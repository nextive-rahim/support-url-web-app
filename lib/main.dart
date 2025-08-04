import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nayeem's English Care",
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
      ),
      home: const MyHomePage(title: 'Support Section'),
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
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                Text(
                  'Nayeem\'s English Care',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Support Section',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    // letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Last updated: August 04, 2025',
                  style: TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.w600,
                    // letterSpacing: 2,
                    // color: Colors.black,
                  ),
                ),
                SizedBox(height: 50),
              Text('''         Support – Nayeem's English Care App
        Welcome to the Nayeem's English Care Support Page
        
        We’re here to help you with any questions or issues related to the Nayeem's English Care app. Below you’ll find resources and contact information for quick assistance.
        
        🔧 Common Troubleshooting
        App Not Opening
        Make sure your app is updated to the latest version.
        Login Issues
        Reset your password from the login screen or contact us if you still face issues.
        Video Not Playing
        Ensure you have a stable internet connection and try restarting the app.
        📩 Contact Us
        If you didn’t find your answer, feel free to contact us:
        
        Email: rahim.nextive@gmail.com
        Phone: +8801718663032
         
        📚 FAQs
        Is the app free to use?
        Yes, the Nayeem's English Care app is completely free.
        Can I use the app offline?
        Currently, an internet connection is required to access most features.
        Where can I give feedback?
        Email us at rahim.nextive@gmail.com
       
        
        Name: Abdul Rahim
        Company: Nextive Solution
        
        Contact :
        phone : +8801718663032
        Email: rahim.nextive@gmail.com
        
        '''),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

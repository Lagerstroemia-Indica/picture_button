import 'package:flutter/material.dart';
import 'package:picture_button/picture_button.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Demo PictureButton Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('count\n$_counter',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 32.0,),
                const Text("anything parameters setting"),
                PictureButton(
                  onPressed: counting,
                  image: Image.asset("assets/google_sign_image.png").image,
                ),
                gap,
        
                const Text("anything parameter setting\n(width:250 in Colum Defined Width parent Widget)"),
                Container(
                  width: 250,
                  color: Colors.black26.withOpacity(0.1),
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PictureButton(
                        onPressed: () {
                          setState(() {
                            _counter++;
                          });
                        },
                        image: const AssetImage("assets/google_sign_image.png"),
                      ),
                      gap,
                      const Text("width:100, height:100, fit:BoxFit.fill"),
                      PictureButton(
                        onPressed: counting,
                        image: const AssetImage("assets/google_sign_image.png"),
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                      gap,
                      const Text("useBubbleEffect: true"),
                      PictureButton(
                        onPressed: counting,
                        image: const AssetImage("assets/google_sign_image.png"),
                        useBubbleEffect: true,
                      ),
                    ],
                  ),
                ),
                gap,
                const Text("[only ripple effect]\n"
                    "highlightColor: Colors.transparent\n"
                    "splashColor: Colors.transparent\n"
                    "useBubbleEffect: true\n"
                    "bubbleEffect: PictureBubbleEffect.expanded,"
                ),
                PictureButton(
                  onPressed: counting,
                  image: Image.asset("assets/google_sign_image.png").image,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  useBubbleEffect: true,
                  bubbleEffect: PictureBubbleEffect.expand,
                )
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void counting() {
    setState(() {
      _counter++;
    });
  }

  Widget get gap => const SizedBox(height: 16,);
}

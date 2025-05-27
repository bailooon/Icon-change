 
import 'package:flutter/material.dart';
 
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {


double size = 200;
double minSize = 100;
double maxSize = 300;

int red = 0;
int green = 0;
int blue = 0;

changeSize(double size){
  setState(() {
    this.size = size;
  });
}

addSize(){
  setState(() {
    if(size + 10 <= maxSize){
      size += 10;
    }
  });
}

removeSize(){
  setState(() {
    if(size - 10 >= minSize){
      size -= 10;
    }
  });
}

void updateColor(String channel, double value) {
    setState(() {
      int v = value.toInt();
      switch (channel) {
        case 'r':
          red = v;
          break;
        case 'g':
          green = v;
          break;
        case 'b':
          blue = v;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter State'),
          actions: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => removeSize(),
            ),
            IconButton(
              icon: const Text('S'),
              onPressed: () => changeSize(100),
            ),
            IconButton(
              icon: const Text('M'),
              onPressed: () => changeSize(200),
            ),
            IconButton(
              icon: const Text('L'),
              onPressed: () => changeSize(300),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => addSize(),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Icon(
                  Icons.lock_clock,
                  size: size,
                  color: Color.fromARGB(255, red, green, blue),
                ),
              ),
            ),
              buildSlider('R', red, Colors.red, (value) => updateColor('r', value)),
              buildSlider('G', green, Colors.green, (value) => updateColor('g', value)),
              buildSlider('B', blue, Colors.blue, (value) => updateColor('b', value)),
          ],
        ));
  }

  Widget buildSlider(String label, int value, Color color, ValueChanged<double> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Slider(
              activeColor: color,
              value: value.toDouble(),
              min: 0,
              max: 255,
              onChanged: onChanged,
            ),
          ),
          Text(
            value.toString(),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );

  }
}
 
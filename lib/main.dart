import 'package:flutter/material.dart';

void main() {
  runApp(const DigitalArtApp());
}

class DigitalArtApp extends StatelessWidget {
  const DigitalArtApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Art Space',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ArtScreen(title: 'Digitized art'),
    );
  }
}

class ArtScreen extends StatefulWidget {
  const ArtScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ArtScreen> createState() => _ArtScreenState();
}

class _ArtScreenState extends State<ArtScreen> {
  int _counter = 0; //Variable to navigate through multiple pieces

  final List<Map<String, dynamic>> artworks = [
    {
      'image': NetworkImage('https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/500px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg?utm_source=en.wikipedia.org&utm_campaign=imageinfo&utm_content=thumbnail',),
      'title': 'Starry Night',
      'artist': 'Vincent van Gogh',
      'year': '1889',
    },
    //Removed the Mona Lisa from the project due 
    {
      'image': NetworkImage('https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/500px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg?utm_source=en.wikipedia.org&utm_campaign=imageinfo&utm_content=thumbnail',),
      'title': 'Mona Lisa',
      'artist': 'Leonardo da Vinci',
      'year': '1503',
    },
    {
      'image': NetworkImage('https://upload.wikimedia.org/wikipedia/en/d/dd/The_Persistence_of_Memory.jpg?utm_source=en.wikipedia.org&utm_campaign=imageinfo&utm_content=original'),
      'title': 'The Persistence of Memory',
      'artist': 'Salvador Dalí',
      'year': '1931',
    },
    {
      'image': NetworkImage('https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a5/Tsunami_by_hokusai_19th_century.jpg/500px-Tsunami_by_hokusai_19th_century.jpg?utm_source=en.wikipedia.org&utm_campaign=imageinfo&utm_content=thumbnail',),
      'title': 'The Great Wave off Kanagawa',
      'artist': 'Katsushika Hokusai',
      'year': '1831',
    },
  ];

  //Rename to navigateToNextPiece
  void _nextArtwork() {
    setState(() {
      _counter = (_counter + 1) % artworks.length;
    });
  }

    void _previousArtwork() {
    setState(() {
      _counter = (_counter - 1 + artworks.length) % artworks.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final artwork = artworks[_counter];

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the ArtScreen object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Digital Art Space'),
      ),
      body: Padding(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        padding: const EdgeInsets.all(20),
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
          children: [
            Container(
              //width: 400,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                color: Colors.grey,
              ),
              child: Image(
                image: artwork['image'],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              artwork['title'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            Text(
              artwork['artist'],
              style: const TextStyle(fontSize: 18),
            ),

            Text(
              artwork['year'],
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,),
            ),

            const SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                ElevatedButton(
                  onPressed: _previousArtwork,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _nextArtwork,
                  child: const Text('Next'),
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}

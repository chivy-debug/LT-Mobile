import 'package:flutter/material.dart';


class ScaffoldExample extends StatelessWidget{
  const ScaffoldExample({super.key});


  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text('Scaffold Example'),
        ),
        body: const Center(
          child: Text('Toi la Vy',
            style: TextStyle(
            fontSize: 24,
            color: Colors.red
          )
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Da nhan vao button');
        },
        child: Icon(Icons.access_alarm),
        ),
      );
    
    
  }
}

class RowExample extends StatelessWidget{
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text('Scaffold Example'),
        ),
        body: const Center(
          child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.email),
                    Text('chivy10112003@gmail.com')
                  ],
           ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Da nhan vao button');
        },
        child: Icon(Icons.access_alarm),
        ),
      );
  }
}

class ColumnExample extends StatelessWidget{
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text('Scaffold Example'),
        ),
        body: const Center(
          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.face),
                    Icon(Icons.umbrella),
                    Icon(Icons.safety_check)
                  ],
           ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Da nhan vao button');
        },
        child: Icon(Icons.access_alarm),
        ),
      );
  }
}


class StackExample extends StatelessWidget{
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text('Scaffold Example'),
        ),
        body: Center(
          child: Stack(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      )

                    ],
           ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Da nhan vao button');
        },
        child: Icon(Icons.access_alarm),
        ),
      );
  }
}

class ContainerExample extends StatelessWidget{
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text('Scaffold Example'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.blue,
            child: Text('Container Blue'),

           ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Da nhan vao button');
        },
        child: Icon(Icons.access_alarm),
        ),
      );
  }
}


class SizedBoxExample extends StatelessWidget{
  const SizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text('Scaffold Example'),
        ),
        body: const Center(
          child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Icon(Icons.email),
                    SizedBox(width: 25,),
                    Text('chivy10112003@gmail.com')
                  ],
           ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Da nhan vao button');
        },
        child: Icon(Icons.access_alarm),
        ),
      );
  }
}

class IconButtonExample extends StatelessWidget{
  const IconButtonExample({super.key});

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text('Scaffold Example'),
        ),
        body: Center(
          child: IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () {
                  print('Icon button Pressed');
                },
           ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Da nhan vao button');
        },
        child: Icon(Icons.access_alarm),
        ),
      );
  }
}


class ImageExample extends StatelessWidget{
  const ImageExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images Example'),
      ),
      body: Center(
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('../assets/images/DDoS.png',
                width: 750,
                height: 350,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20), // Khoảng cách giữa các hình
              Image.network('https://picsum.photos/200/200')
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
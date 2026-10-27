import 'package:flutter/material.dart';
import 'package:praktikum6/input_form.dart';
import 'package:praktikum6/input_validation.dart'; 
import 'main.dart'; 
 
class DynamicBottomNavbar extends StatefulWidget { 
  const DynamicBottomNavbar({super.key}); 
 
  @override 
  State<DynamicBottomNavbar> createState() => _DynamicBottomNavbarState(); 
} 
 
class _DynamicBottomNavbarState extends State<DynamicBottomNavbar> { 
  int _currentPageIndex = 0; 
 
  final List<Widget> _pages = <Widget>[ 
    const MyInput(), 
    const MyFormValidation(),
    const MyInputForm(), 
  ]; 
 
  void onTabTapped(int index) { 
    setState(() { 
      _currentPageIndex = index; 
    }); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: _pages[_currentPageIndex], 
      bottomNavigationBar: BottomNavigationBar( 
        currentIndex: _currentPageIndex, 
        onTap: onTabTapped, 
        items: const [ 
          BottomNavigationBarItem( 
            icon: Icon(Icons.task_alt_outlined), 
            label: 'Latihan', 
          ), 
          BottomNavigationBarItem( 
            icon: Icon(Icons.input_outlined), 
            label: 'Form Validation', 
          ),
          BottomNavigationBarItem( 
            icon: Icon(Icons.input_outlined), 
            label: 'Form Input', 
          ), 
        ], 
        backgroundColor: Colors.blueAccent, 
        selectedItemColor: Colors.yellow, 
        unselectedItemColor: Colors.white, 
      ), 
    ); 
  } 
} 

class MyInput extends StatefulWidget {
  const new({super.key});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> { 
  TextEditingController _controller = TextEditingController(); 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Input Widget'), 
      ), 
      body: Padding( 
        padding: const EdgeInsets.all(16.0), 
        child: Column( 
          children: [ 
            TextField( 
              controller: _controller, 
              decoration: const InputDecoration( 
                hintText: 'Write your name here...', 
                labelText: 'Your Name', 
              ), 
            ), 
            const SizedBox(height: 20), 
            ElevatedButton( 
              child: const Text('Submit'), 
              onPressed: () { 
                showDialog( 
                    context: context, 
                    builder: (context) { 
                      return AlertDialog( 
                        content: Text('Hello, ${_controller.text}'), 
                      ); 
                    }); 
              }, 
            ) 
          ], 
        ), 
      ), 
    );  
  } 
 
  @override 
  void dispose() { 
    _controller.dispose(); 
    super.dispose(); 
  } 
} 

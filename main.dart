import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab Sheet 5',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LabIndexScreen(),
    );
  }
}

class Product {
  final String name;
  final double price;
  Product({required this.name, required this.price});
}

class Student {
  String name;
  String rollNo;
  String course;
  Student({required this.name, required this.rollNo, required this.course});
}

class LabIndexScreen extends StatelessWidget {
  const LabIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> programs = [
      {'title': '1. ListView of 5 Items', 'screen': const Program1Screen()},
      {'title': '2. ListView with ListTile', 'screen': const Program2Screen()},
      {'title': '3. ListView.builder (1 to 100)', 'screen': const Program3Screen()},
      {'title': '4. ListView.builder with Names List', 'screen': const Program4Screen()},
      {'title': '5. ListView.separated with Dividers', 'screen': const Program5Screen()},
      {'title': '6. Horizontally Scrolling List', 'screen': const Program6Screen()},
      {'title': '7. GridView.count (Icons)', 'screen': const Program7Screen()},
      {'title': '8. GridView.builder (Colored Boxes)', 'screen': const Program8Screen()},
      {'title': '9. Products List (Model & Builder)', 'screen': const Program9Screen()},
      {'title': '10. StatelessWidget vs StatefulWidget', 'screen': const Program10Screen()},
      {'title': '11. Counter with setState', 'screen': const Program11Screen()},
      {'title': '12. Increment, Decrement, Reset Counter', 'screen': const Program12Screen()},
      {'title': '13. Add Item using TextField', 'screen': const Program13Screen()},
      {'title': '14. Delete Item on Tap', 'screen': const Program14Screen()},
      {'title': '15. Dismissible Widget (Swipe to Delete)', 'screen': const Program15Screen()},
      {'title': '16. Filter List using Search TextField', 'screen': const Program16Screen()},
      {'title': '17. Student Record List App', 'screen': const Program17Screen()},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Lab Sheet 5 - Programs')),
      body: ListView.builder(
        itemCount: programs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(programs[index]['title']),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => programs[index]['screen']),
              );
            },
          );
        },
      ),
    );
  }
}

// --- PROGRAM 1 ---
class Program1Screen extends StatelessWidget {
  const Program1Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
    return Scaffold(
      appBar: AppBar(title: const Text('Program 1: ListView 5 Items')),
      body: ListView(
        children: items.map((item) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(item, style: const TextStyle(fontSize: 18)),
        )).toList(),
      ),
    );
  }
}

// --- PROGRAM 2 ---
class Program2Screen extends StatelessWidget {
  const Program2Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 2: ListView with ListTile')),
      body: ListView(
        children: const [
          ListTile(leading: Icon(Icons.star), title: Text('Title 1'), subtitle: Text('Subtitle 1')),
          ListTile(leading: Icon(Icons.favorite), title: Text('Title 2'), subtitle: Text('Subtitle 2')),
          ListTile(leading: Icon(Icons.settings), title: Text('Title 3'), subtitle: Text('Subtitle 3')),
        ],
      ),
    );
  }
}

// --- PROGRAM 3 ---
class Program3Screen extends StatelessWidget {
  const Program3Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 3: Numbers 1 to 100')),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Number: ${index + 1}'));
        },
      ),
    );
  }
}

// --- PROGRAM 4 ---
class Program4Screen extends StatelessWidget {
  const Program4Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final names = ['Aarav', 'Vivaan', 'Aditya', 'Vihaan', 'Arjun', 'Sai', 'Reyansh', 'Ayaan'];
    return Scaffold(
      appBar: AppBar(title: const Text('Program 4: Names List')),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(names[index]),
          );
        },
      ),
    );
  }
}

// --- PROGRAM 5 ---
class Program5Screen extends StatelessWidget {
  const Program5Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final items = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];
    return Scaffold(
      appBar: AppBar(title: const Text('Program 5: ListView.separated')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(color: Colors.grey),
        itemBuilder: (context, index) {
          return ListTile(title: Text(items[index]));
        },
      ),
    );
  }
}

// --- PROGRAM 6 ---
class Program6Screen extends StatelessWidget {
  const Program6Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 6: Horizontal List')),
      body: SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: 120,
              margin: const EdgeInsets.all(8),
              color: Colors.blue[(index % 9 + 1) * 100],
              child: Center(child: Text('Box ${index + 1}', style: const TextStyle(color: Colors.white, fontSize: 16))),
            );
          },
        ),
      ),
    );
  }
}

// --- PROGRAM 7 ---
class Program7Screen extends StatelessWidget {
  const Program7Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 7: GridView.count')),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return Card(
            color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.flutter_dash, size: 40),
                Text('Icon ${index + 1}'),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// --- PROGRAM 8 ---
class Program8Screen extends StatelessWidget {
  const Program8Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final colors = [Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple, Colors.amber];
    return Scaffold(
      appBar: AppBar(title: const Text('Program 8: GridView.builder')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Container(
            color: colors[index],
            child: Center(child: Text('Box ${index + 1}', style: const TextStyle(color: Colors.white, fontSize: 18))),
          );
        },
      ),
    );
  }
}

// --- PROGRAM 9 ---
class Program9Screen extends StatelessWidget {
  const Program9Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(name: 'Laptop', price: 55000.0),
      Product(name: 'Smartphone', price: 25000.0),
      Product(name: 'Headphones', price: 2000.0),
      Product(name: 'Smartwatch', price: 5000.0),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Program 9: Products Model List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(products[index].name),
            trailing: Text('₹${products[index].price}', style: const TextStyle(fontWeight: FontWeight.bold)),
          );
        },
      ),
    );
  }
}

// --- PROGRAM 10 ---
class Program10Screen extends StatelessWidget {
  const Program10Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 10: Stateless vs Stateful')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('StatelessWidget:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('It is immutable. Its state cannot change once the widget is built. Example: Text, Icon.'),
            SizedBox(height: 20),
            Text('StatefulWidget:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('It is mutable and can maintain state that can change multiple times during its lifecycle using setState(). Example: Checkbox, Slider, Counter.'),
          ],
        ),
      ),
    );
  }
}

// --- PROGRAM 11 ---
class Program11Screen extends StatefulWidget {
  const Program11Screen({super.key});
  @override
  State<Program11Screen> createState() => _Program11ScreenState();
}
class _Program11ScreenState extends State<Program11Screen> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 11: Counter setState')),
      body: Center(
        child: Text('Count: $_counter', style: const TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _counter++),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// --- PROGRAM 12 ---
class Program12Screen extends StatefulWidget {
  const Program12Screen({super.key});
  @override
  State<Program12Screen> createState() => _Program12ScreenState();
}
class _Program12ScreenState extends State<Program12Screen> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 12: Inc, Dec, Reset')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $_counter', style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => setState(() => _counter++), child: const Text('Increment')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () => setState(() => _counter--), child: const Text('Decrement')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () => setState(() => _counter = 0), child: const Text('Reset')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// --- PROGRAM 13 ---
class Program13Screen extends StatefulWidget {
  const Program13Screen({super.key});
  @override
  State<Program13Screen> createState() => _Program13ScreenState();
}
class _Program13ScreenState extends State<Program13Screen> {
  final List<String> _items = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 13: Add Item via TextField')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _controller, decoration: const InputDecoration(labelText: 'Enter item'))),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      setState(() {
                        _items.add(_controller.text);
                        _controller.clear();
                      });
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) => ListTile(title: Text(_items[index])),
            ),
          )
        ],
      ),
    );
  }
}

// --- PROGRAM 14 ---
class Program14Screen extends StatefulWidget {
  const Program14Screen({super.key});
  @override
  State<Program14Screen> createState() => _Program14ScreenState();
}
class _Program14ScreenState extends State<Program14Screen> {
  final List<String> _items = ['Item A', 'Item B', 'Item C'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 14: Delete Item on Tap')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => setState(() => _items.removeAt(index)),
            ),
          );
        },
      ),
    );
  }
}

// --- PROGRAM 15 ---
class Program15Screen extends StatefulWidget {
  const Program15Screen({super.key});
  @override
  State<Program15Screen> createState() => _Program15ScreenState();
}
class _Program15ScreenState extends State<Program15Screen> {
  final List<String> _items = ['Swipe me 1', 'Swipe me 2', 'Swipe me 3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 15: Dismissible Widget')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_items[index]),
            background: Container(color: Colors.red, child: const Icon(Icons.delete, color: Colors.white)),
            onDismissed: (direction) {
              setState(() => _items.removeAt(index));
            },
            child: ListTile(title: Text(_items[index])),
          );
        },
      ),
    );
  }
}

// --- PROGRAM 16 ---
class Program16Screen extends StatefulWidget {
  const Program16Screen({super.key});
  @override
  State<Program16Screen> createState() => _Program16ScreenState();
}
class _Program16ScreenState extends State<Program16Screen> {
  final List<String> _names = ['Aarav', 'Vivaan', 'Aditya', 'Rohan', 'Amit', 'Rahul', 'Neha', 'Priya'];
  List<String> _filteredNames = [];

  @override
  void initState() {
    super.initState();
    _filteredNames = _names;
  }

  void _filterSearch(String query) {
    setState(() {
      _filteredNames = _names.where((name) => name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 16: Search Filter')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterSearch,
              decoration: const InputDecoration(labelText: 'Search', prefixIcon: Icon(Icons.search), border: OutlineInputBorder()),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredNames.length,
              itemBuilder: (context, index) => ListTile(title: Text(_filteredNames[index])),
            ),
          )
        ],
      ),
    );
  }
}

// --- PROGRAM 17 ---
class Program17Screen extends StatefulWidget {
  const Program17Screen({super.key});
  @override
  State<Program17Screen> createState() => _Program17ScreenState();
}
class _Program17ScreenState extends State<Program17Screen> {
  final List<Student> _students = [];
  List<Student> _filteredStudents = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredStudents = _students;
  }

  void _addStudent() {
    if (_nameController.text.isNotEmpty && _rollController.text.isNotEmpty && _courseController.text.isNotEmpty) {
      setState(() {
        _students.add(Student(name: _nameController.text, rollNo: _rollController.text, course: _courseController.text));
        _filteredStudents = _students;
        _nameController.clear();
        _rollController.clear();
        _courseController.clear();
      });
      Navigator.pop(context);
    }
  }

  void _filterStudents(String query) {
    setState(() {
      _filteredStudents = _students.where((s) => s.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name')),
              TextField(controller: _rollController, decoration: const InputDecoration(labelText: 'Roll Number')),
              TextField(controller: _courseController, decoration: const InputDecoration(labelText: 'Course')),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(onPressed: _addStudent, child: const Text('Add')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 17: Student Record App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterStudents,
              decoration: const InputDecoration(labelText: 'Search by name', prefixIcon: Icon(Icons.search), border: OutlineInputBorder()),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredStudents.length,
              itemBuilder: (context, index) {
                final student = _filteredStatesSafe(index); // fallback or direct
                return ListTile(
                  title: Text(_filteredStudents[index].name),
                  subtitle: Text('Roll: ${_filteredStudents[index].rollNo} | Course: ${_filteredStudents[index].course}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _students.remove(_filteredStudents[index]);
                        _filteredStudents = List.from(_students);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
  
  dynamic _filteredStatesSafe(int index) => _filteredStudents[index];
}

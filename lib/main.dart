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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '連絡先'),
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
  final List<Map<String, String>> contacts = [
    {"name": "牧田", "number": "090-1234-1234", "address": "東京都"},
    {"name": "竹内", "number": "010-1234-1234", "address": "東京都"},
    {"name": "小椋", "number": "050-1234-1234", "address": "埼玉県"},
  ];

  void pushRoute({required String name, required String number, required String address}) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
     return ContactInfo(name: name, number: number, address: address);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: const Icon(Icons.phone),
            title: Text(contacts[index]["name"]!),
            subtitle: Text(contacts[index]["number"]!),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: (){
              pushRoute(name: contacts[index]["name"]!, number: contacts[index]["number"]!, address: contacts[index]["address"]!);
            },
          );
        }
      )
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({required String this.name, required String this.number, required String this.address});
  final String name;
  final String number;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: Text("名前: $name"),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: Text("電話: $number"),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text("住所: $address"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
            child: ElevatedButton(
              onPressed: (){
                showDialog(context: context, builder: (context){
                return AlertDialog(title: Column(
                  children: [
                    Text(number),
                    const Text("発信中")
                  ],
                ));
              });
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  Text("電話をかける")
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}


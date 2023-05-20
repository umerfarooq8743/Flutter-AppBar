import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter'),
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
  Icon cusIcon = Icon(Icons.search);
  Widget search = Text(
    "AppBar",
    style: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 35,
        title: search,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          // style: ButtonStyle(
          //   overlayColor: MaterialStateProperty.resolveWith<Color?>(
          //     (Set<MaterialState> states) {
          //       states.contains(MaterialState.hovered);
          //       return Color.fromARGB(255, 5, 235, 55);
          //     },
          //   ),
          // ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(20, 20),
          child: Container(),
        ),
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 236, 3, 3),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (this.cusIcon.icon == Icons.search) {
                    this.cusIcon = Icon(Icons.cancel);
                    this.search = TextField(
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Text",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold)),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    );
                  } else {
                    cusIcon = Icon(Icons.search);
                    search = Text("AppBar");
                  }
                });
              },
              icon: cusIcon),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      bottomSheet: Text(
        "Copyright @2023",
      ),
      floatingActionButton: Icon(Icons.message),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
          child: FutureBuilder(
              future:
                  DefaultAssetBundle.of(context).loadString("asset/data.json"),
              builder: (context, snapshot) {
                var myinfo = jsonDecode(snapshot.data.toString());
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      myinfo["item"][2]["name"],
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                    Divider(),
                    Text(
                      myinfo["item"][0]["rollnumber"],
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 43, 32, 1)),
                    ),
                    Divider(),
                    Text(
                      myinfo["item"][3]["name"],
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 14, 219, 48)),
                    ),
                  ],
                );
              })),
      bottomNavigationBar: BottomAppBar(
        elevation: 60,
        height: 60,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                hoverColor: const Color.fromARGB(255, 235, 24, 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      size: 33,
                    ),
                    Text(
                      "Verified",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                hoverColor: const Color.fromARGB(255, 235, 24, 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      size: 33,
                    ),
                    Text(
                      "Search",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                hoverColor: const Color.fromARGB(255, 235, 24, 9),
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_balance,
                      size: 33,
                    ),
                    Text(
                      "Account",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

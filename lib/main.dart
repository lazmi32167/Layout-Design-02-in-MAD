 import 'package:flutter/material.dart';

void main() {
  runApp(const BUCSE9());
}

class BUCSE9 extends StatelessWidget {
  const BUCSE9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:
         AppBar(
          title: Text("4th April 2026"),
          backgroundColor: Colors.greenAccent,
          centerTitle: true,

          leading: Icon(Icons.arrow_back),
        ),
        body: 
        SafeArea(
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                             height:100,
                            color: Colors.redAccent,
                            child: Center(child: Text("22CSE004")),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                             height:100,
                            color: Colors.greenAccent,
                            child: Center(child: Text("AB+")),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                             height:100,
                            color: Colors.blueAccent,
                            child: Center(child: Text("Barishal")),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 120),

                    Center(
                      child: Container(
                        height: 90,
                        width: 200,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: const Center(child: Text("110-004-22")),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purpleAccent,
                  ),
                  child: const Center(child: Text("Lazmi")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
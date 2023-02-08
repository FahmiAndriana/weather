import 'package:flutter/material.dart';
import 'package:latihan_lagi/constant/colors.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: Column(children: [
        Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                appBlue,
                appBlue,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "DKI Jakarta",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: appWhite),
                    ),
                    const Icon(Icons.arrow_drop_down)
                  ],
                ),
                const Text('Kota jakarta Barat',
                    style: TextStyle(color: appWhite)),
                const Text(
                  '27',
                  style: TextStyle(fontSize: 70, color: appWhite),
                ),
                const Text("Jum'at, 31 Juli 09:00",
                    style: TextStyle(color: appWhite)),
                const Text('Cerah Berawan', style: TextStyle(color: appWhite)),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Lottie.asset("assets/lottie/cloude.json",
                      fit: BoxFit.contain),
                ),
                // Stack(
                //   children: [
                //     Opacity(
                //       opacity: 0.5,
                //       child: ClipPath(
                //           clipper: WaveClipper(),
                //           child: Container(
                //             color: appWhite,
                //             height: 100,
                //           )),
                //     ),
                //     ClipPath(
                //         clipper: WaveClipper(),
                //         child: Container(
                //           color: appBlue,
                //           height: 100,
                //         )),
                //   ],
                // )
              ],
            ),
          ),
        ),
        const TabBar(
          unselectedLabelColor: appBlue,
          unselectedLabelStyle: TextStyle(color: appBlue),
          tabs: [
            Tab(
              text: "Hari ini",
            ),
            Tab(
              text: "Besok",
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            children: [
              Expanded(
                  child: Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("00:00"),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(Icons.cloud),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "25",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("00:00"),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(Icons.cloud),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "25",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("00:00"),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(Icons.cloud),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "25",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Text("data"),
            ],
          ),
        ),
      ]),
    ));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(
        0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}

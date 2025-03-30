import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final api = DefaultApi(ApiClient(basePath: "http://localhost:8000"));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourplanning',
      home: Scaffold(
        appBar: AppBar(title: Text("Optimierte Route")),
        body: FutureBuilder<TourResponse>(
          future: api.routePost(
            TourRequest(
              stops: [
                Stop(name: "Brandenburger Tor"),
                Stop(name: "Alexanderplatz")
              ],
              optimize: true,
            ),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());

            if (snapshot.hasError)
              return Center(child: Text("Error: ${snapshot.error}"));

            final tour = snapshot.data!;
            return ListView.builder(
              itemCount: tour.optimizedRoute?.order?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tour.optimizedRoute!.order![index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

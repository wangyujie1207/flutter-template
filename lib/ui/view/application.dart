import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/widgets/loading_widget.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CupertinoActivityIndicator(radius: 15),
          const CLoading(),
          GestureDetector(
            onTap: () {
            },
            child: Container(
              width: 100,
              height: 50,
              color: Colors.orange,
              child: const Center(child: Text("test", style: TextStyle(color: Colors.black),)),
            ),
          )
        ],
      ),
    );
  }
}

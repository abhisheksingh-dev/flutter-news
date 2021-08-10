import 'package:flutter/material.dart';

class NewBuilder extends StatefulWidget {
  const NewBuilder(
      {Key? key,
      required this.name,
      required this.url,
      required this.desc,
      required this.image})
      : super(key: key);
  final String name;
  final String url;
  final String desc;
  final String image;

  @override
  _NewBuilderState createState() => _NewBuilderState();
}

class _NewBuilderState extends State<NewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 1.5)],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                  image: DecorationImage(
                      image: NetworkImage("${widget.image}"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Text("${widget.name}"),
              ),
            ),
          ],
        ));
  }
}

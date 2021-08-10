import 'package:flutter/material.dart';
import 'package:news/apiCall.dart';
import 'package:news/newsBuilder.dart';
import 'package:news/newsModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiCall apiCall = ApiCall();
  late Future<List<NewsModel>> getnews;
  @override
  void initState() {
    getnews = apiCall.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDBDBDB),
      appBar: AppBar(
        title: Text("Flutter Future Builder"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 20.0, right: 20.0, bottom: 70.0),
              child: Container(
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: getnews,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<NewsModel>> snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewBuilder(
                              desc: snapshot.data![index].desc,
                              image: snapshot.data![index].image,
                              name: snapshot.data![index].name,
                              url: snapshot.data![index].url,
                            );
                          },
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

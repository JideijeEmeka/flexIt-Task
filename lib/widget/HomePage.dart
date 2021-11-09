import 'package:flutter/material.dart';
import 'package:future_builder_app/api/ApiServiceProvider.dart';
import 'package:future_builder_app/pojo/Data.dart';
import 'package:future_builder_app/pojo/Response.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServiceProvider _apiServiceProvider = new ApiServiceProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List of Users"),
        ),
        body: FutureBuilder<Response>(
          future: _apiServiceProvider.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Data> list = snapshot.data.data;
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    Data user = list[index];
                    return ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("User Details"),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('FullName: ' +
                                      user.firstName +
                                      " " +
                                      user.lastName),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('Email: ' + user.email),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                      title: Text(user.firstName),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

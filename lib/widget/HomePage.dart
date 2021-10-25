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
          title: Text("User List"),
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
                    return GestureDetector(
                      onTap: () {
                        showAlertDialog(BuildContext context) {
                          // set up the button
                          Widget okButton = TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );

                          // set up the AlertDialog
                          AlertDialog alert = AlertDialog(
                            title: Text(user.firstName + " " + user.lastName),
                            content: Text(user.email),
                            actions: [
                              okButton,
                            ],
                          );

                          // show the dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        }
                      },
                      child: ListTile(
                        title: Text(user.firstName),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
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

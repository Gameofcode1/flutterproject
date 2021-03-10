import 'package:flutter/material.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyProfile());
  }
}

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.backspace, size: data.size.height / 20,),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    
                      Icons.store,
                      size: data.size.height / 20,
                    ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Container(
                    
                     margin: EdgeInsets.only(top:20.0),
                     width:data.size.width/4 ,
                     height: 2.0,
                     color: Colors.orange[800],
                   ),
                    CircleAvatar(
                      radius: data.size.height / 12,
                      backgroundColor: Colors.orange[800],
                    ),
                     Container(
                       margin: EdgeInsets.only(top:20.0),
                       width:data.size.width/4 ,
                     height: 2.0,
                     color: Colors.orange[800],
                   ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("New User",
                  style: TextStyle(
                      fontSize: data.size.height / 27,
                      fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email),
                SizedBox(width: data.size.width / 33),
                Text("Pudasaini.saugatt@gmail.com")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(width: data.size.width / 33),
                Text("9845362828")
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 90.0, right: 90.0, top: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.orange[800],
                ),
                width: double.infinity,
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: data.size.width / 33),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: data.size.height / 42),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
              child: Card(
                elevation: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  width: double.infinity,
                  height: 55.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.edit),
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: data.size.height / 42),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Card(
                elevation: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  width: double.infinity,
                  height: 55.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.edit),
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: data.size.height / 42),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Card(
                elevation: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  width: double.infinity,
                  height: 55.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.edit),
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: data.size.height / 42),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Card(
                elevation: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  width: double.infinity,
                  height: 55.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.edit),
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: data.size.height / 42),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

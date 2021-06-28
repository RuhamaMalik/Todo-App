import 'package:flutter/material.dart';

void main() {}

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var output = '';
  List<dynamic> lst = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'TodoApp',
                style: TextStyle(
                  color: Color(0xff5c0b06),
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.orange, Colors.black],
                ),
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [Color(0xff121136), Colors.white, Color(0xff121136)],
                // ),
                image: DecorationImage(
                    image: AssetImage("assets/ee.jpeg"), fit: BoxFit.cover)),
            child: ListView.builder(
                itemCount: lst.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    color: Colors.black54,
                    margin: EdgeInsets.only(top: 15, right: 10, left: 10),
                    child: ListTile(
                        title: Text(
                          "${lst[index]}",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 25,
                          ),
                        ),
                        trailing: Container(
                          width: 50,
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Edit Item'),
                                            content: TextField(
                                              onChanged: (value) {
                                                output = value;
                                              },
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    lst.replaceRange(index,
                                                        index + 1, {output});
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Edit'),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors
                                                      .red[100], // background
                                                  onPrimary: Colors
                                                      .black, // foreground
                                                ),
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      lst.removeAt(index);
                                    });
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.green,
                                  )),
                            ],
                          ),
                        )),
                  );
                }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Add Item'),
                      content: TextField(
                        onChanged: (value) {
                          output = value;
                        },
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              lst.add(output);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('add'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red[100], // background
                            onPrimary: Colors.black, // foreground
                          ),
                        )
                      ],
                    );
                  });
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.amberAccent,
          ),
        ));
  }
}

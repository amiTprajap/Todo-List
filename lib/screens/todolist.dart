import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}
class _TodoListState extends State<TodoList> {

  List todos = [];
  String input = "";
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos.add("Item1");
    todos.add("Item2");
    todos.add("Item3");
    todos.add("Item4");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
          itemCount:todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  color: Colors.teal.shade200,
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: ListTile(
                    title: Text(todos[index]),
                    trailing: IconButton(icon: Icon(Icons.delete_outline,color: Colors.redAccent,),
                      onPressed: (){
                        setState((){
                          todos.removeAt(index);
                        });
                      },
                    ),
                  ),
                )
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  title: Text('Add TodoList'),
                  content: TextField(
                    onChanged: (String value){
                      input = value;
                    },
                  ),
                  actions: [
                    TextButton(
                        onPressed: (){
                          setState((){
                            todos.add(input);
                          });
                          Navigator.pop(context);
                        },
                        child: Text("Add")
                    )
                  ],
                );
              }
          );
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
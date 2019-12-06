import 'package:exptodoapp/todo.dart';
import 'package:flutter/material.dart';

void main() => runApp(Page());

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      initialRoute: "/",
      routes: {"/": (context) => MainPage()},
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO APP"),
        actions: <Widget>[Icon(Icons.add)],
      ),
      body: AddTodo(),
    );
  }
}

class AddTodo extends StatefulWidget {
  AddTodo({Key key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final List<Todo> todos = [];

  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: textField,
          ),
          SizedBox(
            height: 50.0,
          ),
          Expanded(child: listTodo())
        ],
      ),
    );
  }

  Widget get textField {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        suffix: IconButton(
          icon: Icon(Icons.add_circle_outline),
          onPressed: () {
            Todo addTodo = new Todo(todoName: _controller.text, state: false);

            todos.add(addTodo);
          },
        ),
      ),
    );
  }

  Widget listTodo() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => ListTile(
            onTap: () {
              setState(() {
                todos[index].state = !todos[index].state;
              });
            },
            title: Text(todos[index].todoName),
            trailing: Icon(todos[index].state == false
                ? Icons.check_box_outline_blank
                : Icons.check_box),
          ),
    );
  }
}

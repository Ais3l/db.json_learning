// import 'package:flutter/material.dart';
// import 'TodoAddScreen.dart';
// import 'TodoService.dart';
// import 'Todo.dart';

// class TodoListScreen extends StatefulWidget {
//   const TodoListScreen({Key? key}) : super(key: key);

//   @override
//   State<TodoListScreen> createState() => _TodoListScreenState();
// }

// class _TodoListScreenState extends State<TodoListScreen> {
//   updateListUI() {
//     setState((() => {}));
//     print("updateListUI");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todo List'),
//       ),
//       body: FutureBuilder<List<Todo>>(
//         future: TodoService.getTodos(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final todos = snapshot.data!;
//             return ListView.builder(
//               itemCount: todos.length,
//               itemBuilder: (context, index) {
//                 final todo = todos[index];
//                 return ListTile(
//                   title: Text(todo.title),
//                   trailing: Checkbox(
//                     value: todo.completed,
//                     onChanged: (value) {
//                       // TODO : update todo
//                       print('update');
//                       TodoService.updateTodo(
//                         Todo(
//                           id: todo.id,
//                           title: todo.title,
//                           completed: value!,
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           print('add');
//           // move to page add TodoAddscreen
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                     TodoAddScreen(callUpdateUI: updateListUI)),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'TodoAddScreen.dart';
import 'TodoService.dart';
import 'Todo.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  updateListUI() {
    setState(() {
      // Refresh the UI after adding a new Todo or making updates
    });
    print("updateListUI");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: TodoService.getTodos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Due Date: ${todo.dueDate}'), // Display due date
                      Text('Category: ${todo.category}'), // Display category
                      Text('Estimated Time: ${todo.estimatedTime} min'), // Display estimated time
                    ],
                  ),
                  trailing: Checkbox(
                    value: todo.completed,
                    onChanged: (value) {
                      print('update');
                      TodoService.updateTodo(
                        Todo(
                          id: todo.id,
                          title: todo.title,
                          completed: value!,
                          dueDate: todo.dueDate,
                          category: todo.category,
                          estimatedTime: todo.estimatedTime,
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('add');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TodoAddScreen(callUpdateUI: updateListUI)),
          );
        },
      ),
    );
  }
}


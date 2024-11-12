// import 'package:flutter/material.dart';
// import 'TodoService.dart';
// import 'Todo.dart';

// class TodoAddScreen extends StatefulWidget {
//   Function callUpdateUI;

//   TodoAddScreen({Key? key, required this.callUpdateUI}) : super(key: key);
//   @override
//   _TodoAddScreenState createState() => _TodoAddScreenState();
// }

// class _TodoAddScreenState extends State<TodoAddScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _titleController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Todo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _titleController,
//                 decoration: InputDecoration(
//                   labelText: 'Title',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Title is required';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     final newTodo = Todo(
//                       id: '0',
//                       title: _titleController.text,
//                       completed: false,
//                     );

//                     final createdTodo = await TodoService.createTodo(newTodo);
//                     widget.callUpdateUI();
//                     Navigator.pop(context, createdTodo);
//                   }
//                 },
//                 child: Text('Add'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'TodoService.dart';
import 'Todo.dart';

class TodoAddScreen extends StatefulWidget {
  Function callUpdateUI;

  TodoAddScreen({Key? key, required this.callUpdateUI}) : super(key: key);

  @override
  _TodoAddScreenState createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _dueDateController = TextEditingController(); // New controller for due date
  final _categoryController = TextEditingController(); // New controller for category
  final _estimatedTimeController = TextEditingController(); // New controller for estimated time

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title field
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Due Date field
              TextFormField(
                controller: _dueDateController,
                decoration: InputDecoration(
                  labelText: 'Due Date',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Due Date is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Category field
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Category is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Estimated Time field
              TextFormField(
                controller: _estimatedTimeController,
                decoration: InputDecoration(
                  labelText: 'Estimated Time (minutes)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Estimated Time is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Add button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newTodo = Todo(
                      id: '0', // ID should be generated or handled by your service
                      title: _titleController.text,
                      completed: false,
                      dueDate: _dueDateController.text,
                      category: _categoryController.text,
                      estimatedTime: int.parse(_estimatedTimeController.text),
                    );

                    final createdTodo = await TodoService.createTodo(newTodo);
                    widget.callUpdateUI(); // Trigger UI update
                    Navigator.pop(context, createdTodo); // Go back to the previous screen
                  }
                },
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

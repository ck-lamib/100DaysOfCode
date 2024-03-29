import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:http/http.dart' as http;

import 'package:todo_bloc/presentation/models/todo.dart';
import 'package:todo_bloc/presentation/screens/todo.dart';
import 'package:todo_bloc/presentation/shared/base_url.dart';
import 'package:todo_bloc/presentation/widgets/add_edit_todo.dart';
import 'package:todo_bloc/presentation/widgets/alert_dialog.dart';
import 'package:todo_bloc/presentation/widgets/custom_text_field.dart';
import 'package:todo_bloc/presentation/widgets/todo_card.dart';

// Home widget
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Create state todos
  List<Todo> todos = [];
  // Crate state filteredTodo
  List<Todo> filteredTodo = [];

// Create text editiong controller titleController
  TextEditingController titleController = TextEditingController();

  // Create text editiong controller descriptionController
  TextEditingController descriptionController = TextEditingController();

  // Create state todoId
  String todoId = '';

// Create state isLoading
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Call the function to fetch all the todos
    getTodos();
  }

// Create a function to fetch all todos
  getTodos() async {
    // assign the URL
    var url = "${baseUrl}get_todos.php";
    // // Parse the URL
    // var parseUri = Uri.parse(url);
    // // Make the request and return the response
    // var resp = await http.get(parseUri);
    // // Parse the response
    // var decoded = json.decode(resp.body);

    var parseUrl = await http.get(Uri.parse(url));
    var decoded = jsonDecode(parseUrl.body);
    // Assign the todos
    List<Todo> todoList = AllTodo.fromJson(decoded).todo!;

    // Update the state
    setState(() {
      todos = todoList;
      filteredTodo = todoList;
    });
  }

  // Search todo function
  searchTodo(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredTodo = todos;
      });
    } else {
      List<Todo> temp = [];

      todos.map((e) {
        if (e.title!.toLowerCase().contains(query.toLowerCase())) {
          temp.add(e);
        }
      }).toList();

      setState(() {
        filteredTodo = temp;
      });
    }
  }

  deleteTodo(String id) async {
    var url = "${baseUrl}delete_todos.php";
    var parseUri = Uri.parse(url);
    var resp = await http.post(parseUri, body: {'id': id});
    var decoded = json.decode(resp.body);

    if (decoded['success']) {
      print('Success');
      getTodos();
    } else {
      print('Failed');
    }
  }

  onTodoAdd(context) async {
    setState(() {
      isLoading = true;
    });

    var url = "${baseUrl}add_todos.php";
    var body = {
      'title': titleController.text,
      'description': descriptionController.text,
    };
    if (todoId.isNotEmpty) {
      url = "${baseUrl}update_todos.php";
      body['id'] = todoId;
    }

    var resp = await http.post(Uri.parse(url), body: body);
    var decoded = jsonDecode(resp.body);

    // var parseUri = Uri.parse(url);
    // var resp = await http.post(parseUri, body: body);
    // var decoded = json.decode(resp.body);

    if (decoded['success']) {
      print('Success');
      getTodos();
      titleController.clear();
      descriptionController.clear();
      Navigator.pop(context);
    } else {
      print('Failed');
    }
    setState(() {
      isLoading = false;
    });
  }

  displayAddEditModal(context) {
    showDialog(
        context: (context),
        builder: (context) => Dialog(
              child: AddEditTodo(
                  titleController: titleController,
                  descriptionController: descriptionController,
                  todoId: todoId,
                  onCancel: () {
                    Navigator.pop(context);
                    setState(() {
                      todoId = '';
                    });
                    titleController.clear();
                    descriptionController.clear();
                  },
                  onConfirm: () {
                    onTodoAdd(context);
                  }),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'To Do',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 40,
              color: Color(0xff000000),
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                displayAddEditModal(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              if (isLoading) const Text('Loading . . .'),
              CustomTextField(
                hint: 'Search . . .',
                onChange: searchTodo,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: filteredTodo
                      .map(
                        (Todo todo) => Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (val) {
                                  setState(() {
                                    todoId = todo.id!;
                                  });
                                  titleController.text = todo.title!;
                                  descriptionController.text = todo.description!;
                                  displayAddEditModal(context);
                                },
                                backgroundColor: const Color(0xFF93B7FF),
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                              SlidableAction(
                                onPressed: (val) {
                                  customAlertDialog(
                                      context: context,
                                      title: 'Delete',
                                      content: 'Are you sure you want to delete this todo?',
                                      onConfirm: () {
                                        Navigator.pop(context);
                                        deleteTodo(todo.id!);
                                      });
                                },
                                backgroundColor: const Color(0xFFff0000),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Todos(
                                        todo: todo,
                                      )));
                            },
                            child: TodoCard(todo: todo),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ))
            ],
          ),
        ));
  }
}

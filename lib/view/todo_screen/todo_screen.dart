import 'package:api_fetching_examples/controller/todo_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<TodoListController>().todoFetchData();
    }); // for state change after the ui build
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todores = context.watch<TodoListController>();
    return Scaffold(
      appBar: AppBar(title: Text("Todo List")),
      body: todores.isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                await context.read<TodoListController>().todoFetchData();
              },
              child: ListView.builder(
                // physics: AlwaysScrollableScrollPhysics(),  // it should be on when a non scrollable item for regresh
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(10),
                  color: index.isEven ? Colors.greenAccent.shade100 : null,
                  child: CheckboxListTile(
                    value: todores.listtodo[index].completed ?? false,
                    onChanged: (value) {},
                    title: Text(todores.listtodo[index].todo ?? ""),
                  ),
                ),
                itemCount: todores.listtodo.length,
              ),
            ),
    );
  }
}

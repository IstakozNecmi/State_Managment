import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stateManangment/stateNotifier/statenotifier1/statenotifiermodel1.dart';

class statenotifierview1 extends ConsumerWidget {
  const statenotifierview1({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes
    List<Todo> todos = ref.watch(todosProvider);

    // Let's render the todos in a scrollable list view
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
      children: [
        for (final todo in todos)
          CheckboxListTile(
            value: todo.completed,
            // When tapping on the todo, change its completed status
            onChanged: (value) => ref.read(todosProvider.notifier).toggle(todo.id),
            title: Text(todo.description),
          ),
      ],

    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      ref.read(todosProvider.notifier).addTodo(Todo(id: "2", description: "sdsdsd222", completed: true));
      
      
    }),
    );
  }
}
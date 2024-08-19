import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:flutter/cupertino.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Tasks> taskLists = [
    const Tasks('Andar de Bike', 'assets/images/bike.webp', 2),
    const Tasks('Ler 50 páginas', 'assets/images/ler.jpg', 1),
    const Tasks('Meditar', 'assets/images/meditar.jpeg', 4),
    const Tasks(
      'Jogar',
      'assets/images/jogar.jpg',
      0,
    )
  ];

  void newTask(String name, String photo, int difficulty) {
    taskLists.add(Tasks(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  /// Fica de olho no estado da informação e notifica quem está utilizando
  @override
  bool updateShouldNotify(TaskInherited old) {
    /// tamanho do estado interior mudou -> notifica
    /// se for falso, não notifica ngm.
    return old.taskLists.length != taskLists.length;
  }
}

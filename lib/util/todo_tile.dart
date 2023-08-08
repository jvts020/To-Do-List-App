import 'package:flutter/material.dart';
import 'package:to_do_list_app/util/custom_checkbox.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  bool showCheckIcon;

  ToDoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    this.showCheckIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color:
              taskCompleted ? const Color(0xFF0B025A) : const Color(0xFF1D02A5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              // Ícone de marca de verificado personalizado
              CustomCheckbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.transparent,
              ),

              const SizedBox(width: 20),

              // Nome da tarefa com decoração de texto riscado quando concluída
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

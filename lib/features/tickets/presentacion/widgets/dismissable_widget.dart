import 'package:flutter/material.dart';

class DismissibleWidget<T> extends StatelessWidget {
  final T item;
  final Widget child;
  final DismissDirectionCallback onDismissed;

  const DismissibleWidget({
    super.key,
    required this.item,
    required this.child,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) => Dismissible(
        key: ObjectKey(item),
        background: buildSwipeActionLeft(),
        secondaryBackground: buildSwipeActionRight(),
        onDismissed: onDismissed,
        child: child,
      );

  Widget buildSwipeActionLeft() => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.green,
        child: const Icon(Icons.archive_sharp, color: Colors.white, size: 32),
      );

  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(Icons.delete_forever, color: Colors.white, size: 32),
      );
}

class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

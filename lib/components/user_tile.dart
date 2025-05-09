import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            //icon
            Icon(Icons.person,
                size: 40, color: const Color.fromARGB(255, 0, 0, 0)),
            const SizedBox(width: 20),

            //user name
            Text(text,
                style: TextStyle(
                    fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0))),
          ],
        ),
      ),
    );
  }
}

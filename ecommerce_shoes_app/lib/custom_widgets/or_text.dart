
import 'package:flutter/material.dart';

class OrTextModule extends StatelessWidget {
  const OrTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 1, child: Container(color: Colors.grey.shade300, height: 2)),
        const SizedBox(
          width: 5,
        ),
        const Text(
          "OR",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 1, child: Container(color: Colors.grey.shade300, height: 2)),
      ],
    );
  }
}

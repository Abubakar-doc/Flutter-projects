import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class description extends StatelessWidget {
  const description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        'We will use this information to suggest a better diet plan for you.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 18.0,
        ),
      ),
    );
  }
}

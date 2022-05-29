import 'package:flutter/material.dart';

/// Widget which displays a blue gradient.
class GradientLaunchHome extends StatelessWidget {
  const GradientLaunchHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF0725A5),
          gradient: RadialGradient(
            radius: 0.6,
            colors: [
              const Color(0xFF0725A5).withOpacity(0.2),
              const Color(0xFF0725A5).withOpacity(0.4),
              const Color(0xFF0725A5).withOpacity(0.6),
              const Color(0xFF0725A5).withOpacity(0.7),
              const Color(0xFF0725A5).withOpacity(0.8),
              const Color(0xFF0725A5).withOpacity(0.9),
              const Color(0xFF0725A5),
              const Color(0xFF0725A5),
              const Color(0xFF0725A5),
            ],
          )
      ),
    );
  }
}
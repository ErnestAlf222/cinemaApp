import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              SpinPerfect(
                  animate: true,
                  child: Icon(
                    Icons.slow_motion_video,
                    color: colors.primary,
                    size: 35,
                  )),
              const SizedBox(width: 12),
              Text('Cinemapedia', style: titleStyle),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class FacilityCard extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback onPressed;
  const FacilityCard(
      {super.key,
      required this.label,
      required this.imagePath,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      /// todo: Replace with proper inkwell
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kPadding24),
        child: Container(
          width: MediaQuery.sizeOf(context).width * .45,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.cover),
            color: Colors.black,
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(.7),
                    ])),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * .45,
                  padding: const EdgeInsets.all(kPadding16),
                  child: Text(
                    label,
                    style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w800, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

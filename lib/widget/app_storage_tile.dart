import 'package:flutter/material.dart';

class AppStorageTile extends StatelessWidget {
  final Color color;
  final String name;
  final String size;
  final double percentage;

  const AppStorageTile({
    super.key,
    required this.color,
    required this.name,
    required this.size,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Indicator
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 18)),
                  Text(
                    size,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),

          // Progress
          Stack(
            children: [
              Container(
                width: 120,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF7FE),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 120 * percentage / 100,
                  height: 4,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

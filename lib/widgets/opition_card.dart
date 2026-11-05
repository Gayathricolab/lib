import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String option;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.option,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      child: InkWell(
        onTap: onTap,

        borderRadius: BorderRadius.circular(12),

        child: Container(
          padding: const EdgeInsets.all(15),

          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade100 : Colors.white,

            borderRadius: BorderRadius.circular(12),

            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey.shade300,

              width: isSelected ? 2 : 1,
            ),
          ),

          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,

                child: Text(String.fromCharCode(65 + index)),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Text(
                  option,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              if (isSelected)
                const Icon(Icons.check_circle, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

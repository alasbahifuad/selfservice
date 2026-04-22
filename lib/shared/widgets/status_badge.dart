import 'package:flutter/material.dart';

enum StatusType { present, late, absent, approved, rejected, pending }

class StatusBadge extends StatelessWidget {
  final StatusType type;
  final String? label;

  const StatusBadge({
    super.key,
    required this.type,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    IconData icon;
    String text;

    switch (type) {
      case StatusType.present:
      case StatusType.approved:
        bgColor = const Color(0xFFE8F5E9);
        textColor = const Color(0xFF2E7D32);
        icon = Icons.check_circle_outline;
        text = label ?? (type == StatusType.present ? 'حاضر' : 'مقبول');
        break;
      case StatusType.late:
      case StatusType.pending:
        bgColor = const Color(0xFFFFF3E0);
        textColor = const Color(0xFFEF6C00);
        icon = Icons.access_time;
        text = label ?? (type == StatusType.late ? 'متأخر' : 'قيد الانتظار');
        break;
      case StatusType.absent:
      case StatusType.rejected:
        bgColor = const Color(0xFFFFEBEE);
        textColor = const Color(0xFFC62828);
        icon = Icons.highlight_off;
        text = label ?? (type == StatusType.absent ? 'غائب' : 'مرفوض');
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

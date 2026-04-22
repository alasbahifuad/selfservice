import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';

class EvaluationSettingsScreen extends StatelessWidget {
  const EvaluationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mockSettings = [
      {'name': 'الالتزام بالمواعيد', 'weight': 20, 'active': true, 'required': true, 'order': 1},
      {'name': 'جودة العمل', 'weight': 30, 'active': true, 'required': true, 'order': 2},
      {'name': 'التعاون الجماعي', 'weight': 20, 'active': true, 'required': false, 'order': 3},
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('إعدادات معايير التقييم'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_outline)),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: mockSettings.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = mockSettings[index];
          return AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item['name'], style: AppTypography.headlineArabic.copyWith(fontSize: 17, fontWeight: FontWeight.bold)),
                    Switch(value: item['active'], onChanged: (val) {}),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildInfoBadge('الوزن: ${item['weight']}%', AppColors.primary),
                    const SizedBox(width: 8),
                    _buildInfoBadge(item['required'] ? 'إلزامي' : 'اختياري', AppColors.secondary),
                    const SizedBox(width: 8),
                    _buildInfoBadge('الترتيب: ${item['order']}', AppColors.onSurfaceVariant),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 12),
                Text('تسميات النجوم (Star Labels)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.onSurfaceVariant)),
                const SizedBox(height: 8),
                const Text('5: استثنائي | 4: يفوق التوقعات | 3: يقابل التوقعات | 2: لا يقابل | 1: أقل', style: TextStyle(fontSize: 10)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }
}

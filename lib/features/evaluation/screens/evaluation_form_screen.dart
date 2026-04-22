import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_button.dart';

class EvaluationFormScreen extends StatefulWidget {
  const EvaluationFormScreen({super.key});

  @override
  State<EvaluationFormScreen> createState() => _EvaluationFormScreenState();
}

class _EvaluationFormScreenState extends State<EvaluationFormScreen> {
  String? selectedEmployee = 'أحمد محمد';
  String selectedMonth = 'أكتوبر';
  int selectedYear = 2023;

  final List<Map<String, dynamic>> criteria = [
    {'name': 'الالتزام بمواعيد الدوام', 'weight': 20, 'rating': 5},
    {'name': 'جودة المخرجات والعمل', 'weight': 30, 'rating': 4},
    {'name': 'التعاون مع الفريق', 'weight': 20, 'rating': 3},
    {'name': 'المبادرة والابتكار', 'weight': 15, 'rating': 2},
    {'name': 'السلوك العام والمهنية', 'weight': 15, 'rating': 5},
  ];

  String _getRatingText(int rating) {
    switch (rating) {
      case 5: return 'استثنائي';
      case 4: return 'يفوق التوقعات';
      case 3: return 'يقابل التوقعات';
      case 2: return 'لا يقابل التوقعات';
      case 1: return 'أقل من المتوقع';
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('تقييم الأداء الشهري'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Manager Access Info
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.admin_panel_settings, color: AppColors.secondary),
                  const SizedBox(width: 12),
                  Text('هذه الشاشة مخصصة للمديرين فقط', style: TextStyle(color: AppColors.secondary, fontSize: 13, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Selection Fields
            AppCard(
              child: Column(
                children: [
                  _buildDropdown('اختر الموظف', selectedEmployee, ['أحمد محمد', 'سارة خالد', 'ياسين علي']),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _buildDropdown('الشهر', selectedMonth, ['أكتوبر', 'نوفمبر', 'ديسمبر'])),
                      const SizedBox(width: 16),
                      Expanded(child: _buildDropdown('السنة', selectedYear.toString(), ['2023', '2024'])),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            Text('معايير التقييم', style: AppTypography.headlineArabic.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            
            // Criteria List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: criteria.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = criteria[index];
                return AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(item['name'], style: AppTypography.headlineArabic.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          Text('الوزن: ${item['weight']}%', style: const TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: List.generate(5, (starIndex) {
                          final starRating = starIndex + 1;
                          return IconButton(
                            onPressed: () => setState(() => item['rating'] = starRating),
                            icon: Icon(
                              starRating <= item['rating'] ? Icons.star : Icons.star_border,
                              color: starRating <= item['rating'] ? Colors.amber : Colors.grey,
                              size: 32,
                            ),
                          );
                        }),
                      ),
                      Text(
                        _getRatingText(item['rating']),
                        style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            
            // Manager Notes
            AppCard(
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ملاحظات المدير', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(hintText: 'أدخل ملاحظاتك حول أداء الموظف...'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            AppButton(text: 'حفظ التقييم', onPressed: () {}),
            const SizedBox(height: 48),
            const Center(
              child: Text(
                'جميع الحقوق محفوظة @2026 فؤاد الأصبحي',
                style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant)),
        DropdownButton<String>(
          value: value,
          isExpanded: true,
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (val) {},
        ),
      ],
    );
  }
}

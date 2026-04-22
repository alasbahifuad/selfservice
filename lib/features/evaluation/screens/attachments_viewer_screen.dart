import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/app_card.dart';

class AttachmentsViewerScreen extends StatelessWidget {
  const AttachmentsViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mockFiles = [
      {'name': 'تقرير_الأداء_الميداني.pdf', 'type': 'PDF', 'size': '2.4 MB', 'date': '25 أكتوبر'},
      {'name': 'صورة_إنجاز_المشروع.jpg', 'type': 'Image', 'size': '1.1 MB', 'date': '20 أكتوبر'},
      {'name': 'فيديو_العرض_التقديمي.mp4', 'type': 'Video', 'size': '15.8 MB', 'date': '18 أكتوبر'},
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('مرفقات التقييم'),
      ),
      body: Column(
        children: [
          // Storage Info
          Container(
            padding: const EdgeInsets.all(24),
            color: AppColors.surfaceContainerLow,
            child: Row(
              children: [
                const Icon(Icons.cloud_done_outlined, color: Colors.green),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('مساحة المرفقات المستخدمة', style: TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant)),
                      SizedBox(height: 4),
                      LinearProgressIndicator(value: 0.3, color: AppColors.primary, backgroundColor: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const Text('30%', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: mockFiles.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final file = mockFiles[index];
                return AppCard(
                  child: Row(
                    children: [
                      _buildFileIcon(file['type']),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(file['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), overflow: TextOverflow.ellipsis),
                            Text('${file['size']} | ${file['date']}', style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildActionIcon(Icons.visibility_outlined, Colors.blue),
                      _buildActionIcon(Icons.download_outlined, Colors.green),
                      _buildActionIcon(Icons.delete_outline, Colors.red),
                    ],
                  ),
                );
              },
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'جميع الحقوق محفوظة @2026 فؤاد الأصبحي',
              style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileIcon(String type) {
    IconData icon;
    Color color;
    switch (type) {
      case 'PDF': icon = Icons.picture_as_pdf; color = Colors.red; break;
      case 'Image': icon = Icons.image_outlined; color = Colors.blue; break;
      default: icon = Icons.movie_outlined; color = Colors.orange;
    }
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
      child: Icon(icon, color: color, size: 24),
    );
  }

  Widget _buildActionIcon(IconData icon, Color color) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon, color: color, size: 20),
      visualDensity: VisualDensity.compact,
    );
  }
}

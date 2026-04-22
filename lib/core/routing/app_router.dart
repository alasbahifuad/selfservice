import 'package:go_router/go_router.dart';
import '../../features/auth/screens/splash_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/attendance/screens/attendance_screen.dart';
import '../../features/attendance/screens/attendance_history_screen.dart';
import '../../features/notifications/screens/notifications_screen.dart';
import '../../features/leave/screens/leaves_screen.dart';
import '../../features/leave/screens/permissions_screen.dart';
import '../../features/salary/screens/salary_impact_screen.dart';
import '../../features/salary/screens/deductions_screen.dart';
import '../../features/salary/screens/payslip_screen.dart';
import '../../features/reports/screens/reports_screen.dart';
import '../../features/tasks/screens/tasks_screen.dart';
import '../../features/tasks/screens/tasks_reports_screen.dart';
import '../../features/expenses/screens/expenses_screen.dart';
import '../../features/expenses/screens/expenses_reports_screen.dart';
import '../../features/evaluation/screens/evaluation_form_screen.dart';
import '../../features/evaluation/screens/evaluation_settings_screen.dart';
import '../../features/evaluation/screens/evaluation_detail_report_screen.dart';
import '../../features/evaluation/screens/evaluation_summary_report_screen.dart';
import '../../features/evaluation/screens/manager_alerts_screen.dart';
import '../../features/evaluation/screens/attachments_viewer_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/attendance',
      builder: (context, state) => const AttendanceScreen(),
    ),
    GoRoute(
      path: '/attendance-history',
      builder: (context, state) => const AttendanceHistoryScreen(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/leaves',
      builder: (context, state) => const LeavesScreen(),
    ),
    GoRoute(
      path: '/permissions',
      builder: (context, state) => const PermissionsScreen(),
    ),
    GoRoute(
      path: '/salary-impact',
      builder: (context, state) => const SalaryImpactScreen(),
    ),
    GoRoute(
      path: '/deductions',
      builder: (context, state) => const DeductionsScreen(),
    ),
    GoRoute(
      path: '/payslip',
      builder: (context, state) => const PayslipScreen(),
    ),
    GoRoute(
      path: '/reports',
      builder: (context, state) => const ReportsScreen(),
    ),
    GoRoute(
      path: '/tasks',
      builder: (context, state) => const TasksScreen(),
    ),
    GoRoute(
      path: '/tasks-reports',
      builder: (context, state) => const TasksReportsScreen(),
    ),
    GoRoute(
      path: '/expenses',
      builder: (context, state) => const ExpensesScreen(),
    ),
    GoRoute(
      path: '/expenses-reports',
      builder: (context, state) => const ExpensesReportsScreen(),
    ),
    GoRoute(
      path: '/evaluation',
      builder: (context, state) => const EvaluationFormScreen(),
    ),
    GoRoute(
      path: '/evaluation-settings',
      builder: (context, state) => const EvaluationSettingsScreen(),
    ),
    GoRoute(
      path: '/evaluation-detail',
      builder: (context, state) => const EvaluationDetailReportScreen(),
    ),
    GoRoute(
      path: '/evaluation-summary',
      builder: (context, state) => const EvaluationSummaryReportScreen(),
    ),
    GoRoute(
      path: '/manager-alerts',
      builder: (context, state) => const ManagerAlertsScreen(),
    ),
    GoRoute(
      path: '/attachments',
      builder: (context, state) => const AttachmentsViewerScreen(),
    ),
  ],
);

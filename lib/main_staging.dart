import 'package:neurofeedback_praxis_app/app/app.dart';
import 'package:neurofeedback_praxis_app/bootstrap.dart';
import 'package:neurofeedback_praxis_app/core/database/supabase.dart';

void main() async {
  await SupaFlow.initialize();
  bootstrap(() => const App());
}

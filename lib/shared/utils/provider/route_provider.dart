import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../feature/register/view_model/register_view_model.dart';

final registerProvider = ChangeNotifierProvider<RegisterViewModel>((ref) => RegisterViewModel());

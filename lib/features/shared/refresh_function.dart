import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/features/Dashboard/domain/providers/provider/dashboard_providers.dart';


final genericFunctions = GenericFunctions();

class GenericFunctions {
  reFreshAllEndpoints(WidgetRef ref, BuildContext context) {
  
             ref.watch(gowagrProvider.notifier).gowagr(ref: ref, context: context,keyword: '',trending: true,size: 20,page: 1, category: '');
  }
}


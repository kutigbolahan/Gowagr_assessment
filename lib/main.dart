import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart' show ResponsiveSizer;

import 'core/config.dart';
import 'features/Dashboard/presentation/pages/dashboard_page.dart';

void main() {

        AppConfig.initDependencies();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return   ResponsiveSizer(builder: (context, orientation, screenType) {
      return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'gowagr',
      
      home: const DashboardPage(),
    );
    });
    
    
   
  }
}


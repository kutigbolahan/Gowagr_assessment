import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/features/Dashboard/data/models/response/events.dart';
import 'package:gowagr_assessment/features/Dashboard/data/models/response/markerts.dart';
import 'package:gowagr_assessment/features/Dashboard/presentation/pages/homepage_page.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart' show ResponsiveSizer;

import 'core/config.dart';


void main() async{
 WidgetsFlutterBinding.ensureInitialized();
     
    AppConfig.setEnvironment(Environment.production);
     final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);


  Hive.registerAdapter(EventsAdapter());
  Hive.registerAdapter(MarketsAdapter());
    await Hive.openBox('gowagrBox');
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
      
      home: const Hompage()
   
    );
    });
    
    
   
  }
}


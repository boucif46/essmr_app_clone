import 'package:essamar/bloc/bloc_product/product_bloc.dart';
import 'package:essamar/bloc/bloc_product/product_event.dart';
import 'package:essamar/bloc/bloc_search_min_max/bloc/search_min_max_bloc.dart';
import 'package:essamar/pages/mainPage.dart';
import 'package:essamar/pages/search_page.dart';
import 'package:essamar/widgets/search_setting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';



void main() {
   
  runApp( 
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc()..add(GetProductEvent()),
        ),
        BlocProvider(
          create: (context) => SearchMinMaxBloc(),
        )
      ],
      child:  const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPageApp(),
    );
  }
}


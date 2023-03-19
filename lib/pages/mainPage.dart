import 'package:essamar/pages/favourite_page.dart';
import 'package:essamar/pages/search_page.dart';
import 'package:essamar/utils/colors.dart';
import 'package:essamar/utils/layout.dart';
import 'package:essamar/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainPageApp extends StatefulWidget {
  const MainPageApp({super.key});

  @override
  State<MainPageApp> createState() => _MainPageAppState();
}

class _MainPageAppState extends State<MainPageApp> {

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: Colors.black,
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(
          height: 60,
          activeColor: AppColors.mainColor,
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
         BottomNavigationBarItem( icon: Icon(Icons.grid_view_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: ''),
           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          
        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 4:
              return CupertinoTabView(builder: (context) {
                return  CupertinoPageScaffold(
                    child: FavouritePage());
              });
            case 3:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                    child:Scaffold(
                  body: Center(
                    child: Text('favourite'),
                  ),
                ));
              });
            case 2:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                    child: SearchPage());
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                    child: Scaffold(
                  body: Center(
                    child: Text('favourite'),
                  ),
                ));
              });
            case 0:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(child: HomePage());
              });
              default: return CupertinoTabView(builder: (context) {
                return const  CupertinoPageScaffold(child: HomePage());
              });
          }
        });
  }
}


/*
Scaffold(
      
      backgroundColor: Colors.white,
     

      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items:const  [
          BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: ''),
          BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: ''),
          BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: ''),
          BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_outlined),
          label: ''),
          BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: ''), 
        ]),
    );
 */




/*

AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 140,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Layout.radius(context, 20)),
                    bottomRight: Radius.circular(Layout.radius(context, 20)),
                    bottomLeft: Radius.circular(Layout.radius(context, 20))),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('اتصل بنا'),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.phone)
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: Layout.width(context, 50),
              height: Layout.height(context, 50),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mainColor),
                  borderRadius:
                      BorderRadius.circular(Layout.radius(context, 30)),
                  image: const DecorationImage(
                      image: AssetImage('images/logo.png'))),
            )
          ],
        ),
      ), */
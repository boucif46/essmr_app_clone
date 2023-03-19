import 'package:essamar/utils/colors.dart';
import 'package:essamar/utils/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailPage extends StatefulWidget {
    final String imageUrl;
  final String title ;
  final num price ;
  final String description;
  const DetailPage({super.key, required this.imageUrl, required this.title, required this.price, required this.description});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child:const  Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Colors.black,
                ),
              ),
              const Icon(
                Icons.favorite_outline,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 590,
              child: SingleChildScrollView(
              
                  child: Column(children: [
                Container(
                  height: Layout.height(context, 350),
                  width: double.maxFinite,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("http://127.0.0.1:8000"+widget.imageUrl),
                          fit: BoxFit.fill)),
                ),
               const  SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: Layout.fontSize(context, 24),
                        ),
                      ),
                    ],
                  ),
                ),
                 const  SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       widget.price.toString() + "دج",
                        style: TextStyle(
                          fontSize: Layout.fontSize(context, 24),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        ":الوصف",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 150,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                   child:  Text(
                      widget.description,
                    textDirection: TextDirection.rtl,
                    
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                  ),
                
                
              ]
                  )
                ),
            ),
             Container(
          margin: EdgeInsets.only(bottom:60,left: 15,right: 15),
          height: 55,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.mainColor
          ),
          child: Center(
            child: Text(
              "اضف الى القائمة",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white
              ),
            ),
          ),
        )
          ],
        )
  );
  }
}

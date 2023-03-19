import 'package:flutter/material.dart';

class rows extends StatelessWidget {
  const rows({
    super.key,
    required this.types,
  });

  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap:(){

              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200]),
                child: const IntrinsicWidth(
                  child: Center(
                    child: Text("سوبر ماركت"),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){

              },
              child:Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[1]),
                ),
              ),),
            ),
            GestureDetector(
              onTap:(){

              },
              child:Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[2]),
                ),
              ),
            ),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap:(){

              },
              child:Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[3]),
                ),
              ),
            ),),
            GestureDetector(
              onTap:(){

              },
              child:Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[1]),
                ),
              ),),
            ),
            GestureDetector(
              onTap:(){

              },
              child:Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[4]),
                ),
              ),
            ),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap:(){

              },
              child:Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[2]),
                ),
              ),
            ),),
            GestureDetector(
              onTap:(){

              },
              child:Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[0]),
                ),
              ),),
            ),
            GestureDetector(
              onTap:(){

              },
              child:Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[2]),
                ),
              ),
            ),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap:(){

              },
              child:Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: const IntrinsicWidth(
                child: Center(
                  child: Text("سوبر ماركت"),
                ),
              ),
            ),),
            GestureDetector(
              onTap:(){

              },
              child:Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[1]),
                ),
              ),),
            ),
            GestureDetector(
              onTap:(){

              },
              child:Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[2]),
                ),
              ),
            ),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap:(){

              },
              child:Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[2]),
                ),
              ),
            ),),
            GestureDetector(
              onTap:(){

              },
              child:Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[0]),
                ),
              ),),
            ),
            GestureDetector(
              onTap:(){

              },
              child:Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[2]),
                ),
              ),
            ),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap:(){

              },
              child:Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[3]),
                ),
              ),
            ),),
            GestureDetector(
              onTap:(){

              },
              child:Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[1]),
                ),
              ),),
            ),
            GestureDetector(
              onTap:(){
                
              },
              child:Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
              child: IntrinsicWidth(
                child: Center(
                  child: Text(types[4]),
                ),
              ),
            ),),
          ],
        )
      ],
    );
  }
}

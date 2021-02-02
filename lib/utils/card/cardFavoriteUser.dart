import 'package:ecloudatm/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget widgetFavoriteUser(String title) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      //  height: 80,
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            SizedBox(height: 10,),

            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Stack(
                  children: [

                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                      backgroundColor: Colors.transparent,
                    ),

                    Positioned(
                        left: 34,
                        top: 34,
                        child:    Icon(Icons.star,color: Colors.amber,size: 20,),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(title, style: styleText(18, Colors.black, true)),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    ),
  );
}

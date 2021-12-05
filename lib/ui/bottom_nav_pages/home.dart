import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:marj/widgets/categories_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('marj'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        drawer: Drawer(),
        body: ListView(children: [
          
          SizedBox(
            height: 200.0,
            width: double.infinity,
            child: Carousel(
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotBgColor: Colors.transparent,
                dotColor: Colors.lightGreenAccent,
                indicatorBgPadding: 5.0,
                dotVerticalPadding: 5.0,
                images: [
                  Image.network(
                    'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_960_720.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://cdn.pixabay.com/photo/2018/03/19/18/20/tea-time-3240766_960_720.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://cdn.pixabay.com/photo/2017/07/17/00/58/coffee-2511065_960_720.jpg',
                    fit: BoxFit.cover,
                  ),
                ]),
          ),
          categoriesButton('Shop by categories', () {}, 'See All'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  cardimg('https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_960_720.jpg', 'text'),
                cardimg("https://cdn.pixabay.com/photo/2018/03/19/18/20/tea-time-3240766_960_720.jpg", 'text'),
                cardimg('https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_960_720.jpg', 'text'),
                cardimg("https://cdn.pixabay.com/photo/2018/03/19/18/20/tea-time-3240766_960_720.jpg", 'text'),
            
                ],
              ),
            ),
          ),
          categoriesButton('Check All Latest', (){}, 'See All'),
          
        ]));
  }
}




// ignore: non_constant_identifier_names
Widget cardimg (String Url,String text){
  return Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(Url))),
                    height: 65.h,
                    width: 150.w,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0.0, 0.0),
                      child: Text(text,style: TextStyle(color: Colors.yellow, fontSize: 20,fontWeight: FontWeight.bold,),),
                    )),
                  ),
                );
                
}
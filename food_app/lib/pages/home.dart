import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//creating a stateless widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) { //scaffold class in flutter which provides many widgets, eg app bar, drawer, floating action button, bottom navigation bar, snack bar
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(children: [
        _searchField()
      ],
      ),
    );
  }

  Container _searchField() {
    return Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff1D1617).withOpacity(0.07),
              blurRadius: 40,
              spreadRadius: 0.0
            )
            
          ]
        ),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            //reducing the height of the text field
            contentPadding: EdgeInsets.all(15),
            hintText: 'Search Pancake',
            hintStyle: TextStyle(
              color: Color(0xffDDDADA),
              fontSize: 14
            ),
            //adding the search Icon
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      indent: 10,//create space from the top
                      endIndent: 10,//create space from the bottom
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none )
          ),
        ),
      );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Breakfast', 
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              ),
              backgroundColor: Colors.amberAccent,
              centerTitle: true,
              leading: 
              GestureDetector(
                onTap: () {
                  
                },
                child:  Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
                  height: 20,
                  width: 20,),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                ),
              ),),
              
              actions: [
                GestureDetector(
                  onTap: () {
                    
                  },
                  child:  Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 37,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset('assets/icons/dots.svg',
                    height: 20,
                    width: 20,),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
                )
                
              ],

    );
  }
}
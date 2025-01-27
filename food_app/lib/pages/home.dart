import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/diet_model.dart';
import 'package:food_app/models/popular_model.dart';
//creating a stateless widget
class HomePage extends StatefulWidget {
const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //used to open the navigation drawer since the scaffold cannot be accessed by the appbar
  //makes scaffold accessible globally and is also used for the scaffold messanger
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  
  //getting the list from the diet function
  
  void _getInitialInfo(){
    categories = CategoryModel.getCategories();
    diets=DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  //method to show a snackbar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),

      action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        
      },
    ),
      
      ),                 
      
    );
  }
  //called when a bottom navigation bar linked is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();//called at the beginning so that the list is filled first then the widgets are displayed.
    // Scaffold class in Flutter which provides many widgets, eg app bar, drawer, floating action button, bottom navigation bar, snack bar
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceDim,
        key: _scaffoldKey,
        
        appBar: appBar(
          
        ),
        //navigation drawer
        drawer: _drawer(context),
        
        body: OrientationBuilder(
          builder: (context,orientation){
            return ListView(//makes the page scrollable vertically
          children: [
            _searchField(),
            const SizedBox(height: 40,), // create a distance from the top
            _categoriesSection(),
            const SizedBox(height: 40,),
            _dietSection(),
            const SizedBox(height: 40,),
            _popular(orientation),
            const SizedBox(height: 40,), //creating space from the bottom of the page
            
            
          ],
        );
      
          }),
        
      ),
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
        //adding a listview to ensure the user can scroll through the options in the drawer if the vertical space is not enough
        child: ListView(
          //removing any padding from the listview
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Text('Drawer Header')
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: (){
                //Close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: (){
                //Close the drawer
                Navigator.pop(context);
              },
            )
          ]
          
        ),
      );
  }

  

  Column _popular(Orientation orientation) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Popular',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  )
              ),
            ),
            const SizedBox(height: 15,),
            ListView.separated(
              itemBuilder: (context,index) {
                return Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(popularDiets[index].iconPath,width:65,
                      height: 65,),
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popularDiets[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16
                            ),
                          ),
                          Text(
                             popularDiets[index].level + ' | ' + popularDiets[index].duration + ' | ' + popularDiets[index].calorie,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7B6F72),
                              fontSize: 13
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child:SvgPicture.asset('assets/icons/button.svg',width:30, height:30,)
                      )
                      
                    ],),
                  decoration: BoxDecoration(
                    color: popularDiets[index].boxIsSelected ?
                     Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: popularDiets[index].boxIsSelected ? [
                      BoxShadow(
                        color: const Color(0xff1D1617).withOpacity(0.07),
                        offset: const Offset(0,10),
                        blurRadius: 40,
                        spreadRadius: 0
                      )
                    ] : []
                  ),
                );
              }, 
              separatorBuilder: (context, index) => const SizedBox(height: 25),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20
              ),
              itemCount: popularDiets.length,
              shrinkWrap: true,
              )
          ],
        );
  }

  Column _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left:20),
              child: Text(
                'Recommendation\nfor Diet',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  )
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 240,
              child: ListView.separated(// separates the items in the list view
                itemBuilder: (context, index){
                  return Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: diets[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(diets[index].iconPath),
                        Column(
                          children: [
                            Text(
                              diets[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                              ),
                            ),
                            Text(
                          diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calorie,
                          style: const TextStyle(
                            color: Color(0xff786F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                          ],
                        ),
                        
                        Container(
                          height: 45,
                          width: 130,
                          child: Center(
                            child: Text('View',
                            style: TextStyle(
                              color: diets[index].viewIsSelected ? Colors.white : const Color(0xffC58BF2),
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                            ),
                            ),
                            ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                 diets[index].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                              diets[index].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent
                              ]),
                              borderRadius: BorderRadius.circular(50)
                          ),
                        )
                      ],),
                  );
                }, 
                separatorBuilder: (context, index)=> const SizedBox(width: 25,), 
                itemCount: diets.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                ),
            )
          ],
        );
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0), // sets space only on the left
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 120,
              child: ListView.separated(//creates a space between the items
                itemCount: categories.length, // Define the number of items
                scrollDirection: Axis.horizontal, //setting the value of the scroll direction
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                separatorBuilder: (context, index) => const SizedBox(width:25,),
                itemBuilder: (context, index) { // used to display the items
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14
                          ),
                        )
                    ],),
                  );
                },
              ),
            )
          ],
        );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.07),
            blurRadius: 40,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          // reducing the height of the text field
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search Pancake',
          hintStyle: const TextStyle(
            color: Color(0xffDDDADA),
            fontSize: 14,
          ),
          // adding the search Icon
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
                  const VerticalDivider(
                    color: Colors.black,
                    indent: 10, // create space from the top
                    endIndent: 10, // create space from the bottom
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
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Diet',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.amber,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Icon(Icons.menu),
          
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            _showSnackBar("Item added to cart");
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/icons/dots.svg',
                height: 20,
                width: 20,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.fastfood), text: 'Popular'),
          Tab(icon: Icon(Icons.category), text: 'Categories'),
          Tab(icon: Icon(Icons.dining), text: 'Diets'),
        ],
      ),
    );
  }


 
}

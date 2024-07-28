//import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
// import '../../models/category.dart';
// import '../../providers/brand_provider.dart';
// import '../../providers/category_provider.dart';
//import '../../models/category.dart';
//import '../../providers/category_provider.dart';
import 'page_home.dart';
// import '../../providers/product_provider.dart';
// import '../../models/products.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  // void initState() {
  //   // Provider.of<UserProvider>(context, listen: false).getUsersFN(
  //   //     name: 'name', email: 'email', phone: 'phone', password: 'password');

  //   super.initState();
  //   tst();
  // }

  // tst() async {
  //   await Provider.of<CategoryProvider>(context, listen: false).getCategoryFN();
  // }

  int index = 0;
  PageController pcIndex = PageController(initialPage: 0);
  int langugeIndex = 0;
  List<int> brandList = [];
  List<int> categoryList = [];
  ScrollController cont = ScrollController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // List<User> users = [];

  // getUsersFN() async {
  //   if (formKey.currentState!.validate()) {
  //     Provider.of<UserProvider>(context, listen: false).getUsers;
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    // List<User> users = Provider.of<UserProvider>(context).getUsers;
    // List<Product> products = Provider.of<ProductProvider>(context).getProducts;
    // List<Categories> categorys =
    //     Provider.of<CategoryProvider>(context).getCategorys;
    // List<Brand> brands = Provider.of<BrandProvider>(context).getBrands;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WOMEN FASHION',
          // style: TextStyle(fontFamily: 'crima'
          // ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: index,
        onTap: (indexval) {
          setState(() {
            index = indexval;
            pcIndex.animateToPage(indexval,
                duration: const Duration(microseconds: 300),
                curve: Curves.linear);
          });
        },
        // showUnselectedLabels: true,   //اظهار عناوين اليبلات
        items: const [
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.notifications),
          //   label: 'Notification',
          //   backgroundColor: Colors.blueGrey,
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
            backgroundColor: Colors.blueGrey,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blueGrey,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Image.asset(
              'lib/assets/images/rigester_image/Image_3.png',
              // width: 100,
              height: 150,
              //fit: BoxFit.fill,
            ),
            const Divider(
              //بساوي خط تحت اي شغلة
              thickness: 2,
            ),
            // Center(
            //   // child: const Text(
            //   //   'shopping',
            //   //   style: TextStyle(
            //   //     fontWeight: FontWeight.bold,
            //   //     color: Colors.blue,
            //   //   ),
            //   // ),
            // ),
            Icon(Icons.abc),

            const ListTile(
              title: Text('my cart'),
              subtitle: Text('test sub title'),
              leading: Icon(Icons.donut_large_sharp),
              // trailing: Icon(Icons.shopping_cart_checkout),
              // هالصفة تعطيني عنوان شو بدي حط بالاخر
              trailing: Icon(Icons.shopping_cart_outlined),
            ),
            ExpansionTile(
              title: Text('Favorite'),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.centerRight,
              childrenPadding: EdgeInsets.all(10),
              trailing: Icon(Icons.favorite),
              // backgroundColor: Colors.red,
              //collapsedBackgroundColor: Colors.red,
              children: [
                // Text('Favorite list'),
                // Text('History list'),
              ],
            ),
            ExpansionTile(
              title: const Text('Language'),
              childrenPadding: const EdgeInsets.all(20),
              children: [
                GridView(
                  // مندوب الكريد
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 80,
                  ),
                  children: [
                    Column(
                      children: [
                        const Text('Arabic'),
                        Radio(
                          value: 0,
                          groupValue: langugeIndex,
                          onChanged: (b) {
                            setState(() {
                              langugeIndex = b!;
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('English'),
                        Radio(
                          value: 1,
                          groupValue: langugeIndex,
                          onChanged: (b) {
                            setState(() {
                              langugeIndex = b!;
                            });
                          },
                        ),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     const Text('France'),
                    //     Radio(
                    //       value: 2,
                    //       groupValue: langugeIndex,
                    //       onChanged: (b) {
                    //         setState(() {
                    //           langugeIndex = b!;
                    //         });
                    //       },
                    //     ),
                    //   ],
                    // ),
                    // Column(
                    //   children: [
                    //     const Text('Turkish'),
                    //     Radio(
                    //       value: 3,
                    //       groupValue: langugeIndex,
                    //       onChanged: (b) {
                    //         setState(() {
                    //           langugeIndex = b!;
                    //         });
                    //       },
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pcIndex,
        onPageChanged: (pageIndexVal) {
          setState(() {
            index = pageIndexVal;
          });
        },
        children: const [
          PageHome(),
          // SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       // Text('data'),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Center(
          //             child: Container(
          //               color: Colors.white,
          //               child: Image.asset(
          //                 'lib/assets/images/rigester_image/Image(2).jpg',
          //                 //height: 40,
          //                 //  width: MediaQuery.of(context).size.width,
          //                 fit: BoxFit.fill,
          //               ),
          //             ),
          //           ),
          //           Center(
          //             child: Container(
          //               color: Colors.white,
          //               child: Image.asset(
          //                 'lib/assets/images/rigester_image/image.png',
          //                 //height: 40,
          //                 //  width: MediaQuery.of(context).size.width,
          //                 fit: BoxFit.fill,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(15.0),
          //         child: SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: Row(
          //             children: [
          //               for (int i = 0; i < categorys.length; i++)
          //                 SizedBox(
          //                   height: 200,
          //                   width: 200,
          //                   child: Card(
          //                       margin: EdgeInsets.all(2),
          //                       color: const Color.fromRGBO(96, 125, 139, 1),
          //                       child: Column(
          //                         children: [
          //                           Text(
          //                             categorys[i].title['ar'],
          //                           ),
          //                           Padding(
          //                             padding: const EdgeInsets.all(8.0),
          //                             child: Image.network(
          //                               "http://192.168.43.137/Fathion/assets/" +
          //                                   categorys[i].image,
          //                               height: 150,
          //                             ),
          //                           ),
          //                         ],
          //                       )

          //                       //   Icon(
          //                       //     Icons.account_box_rounded,
          //                       //     size: 200,
          //                       //   ),
          //                       ),
          //                 ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       SingleChildScrollView(
          //         scrollDirection: Axis.horizontal,
          //         child: Row(
          //           children: [
          //             for (int i = 0; i < 15; i++)
          //               GestureDetector(
          //                 onTap: () {
          //                   setState(() {
          //                     brandList.contains(i)
          //                         ? brandList
          //                             .removeWhere((element) => element == i)
          //                         : brandList.add(i);
          //                   });
          //                 },
          //                 child: Card(
          //                   shadowColor: Colors.blueGrey,
          //                   elevation: 10,
          //                   color: brandList.contains(i)
          //                       ? Colors.green
          //                       : Theme.of(context).cardColor,
          //                   child: Padding(
          //                     padding: EdgeInsets.all(4.0),
          //                     child: Text('Brand $i'), // ماركة او منتج
          //                   ),
          //                 ),
          //               ),
          //           ],
          //         ),
          //       ),
          //       SingleChildScrollView(
          //         scrollDirection: Axis.horizontal,
          //         child: Row(
          //           children: [
          //             for (int i = 0; i < 15; i++)
          //               GestureDetector(
          //                 onTap: () {
          //                   setState(() {
          //                     brandList.contains(i)
          //                         ? categoryList
          //                             .removeWhere((element) => element == i)
          //                         : categoryList.add(i);
          //                   });
          //                 },
          //                 child: Card(
          //                   shadowColor: Colors.blueGrey,
          //                   elevation: 10,
          //                   color: brandList.contains(i)
          //                       ? Colors.green
          //                       : Theme.of(context).cardColor,
          //                   child: Padding(
          //                     padding: const EdgeInsets.all(4.0),
          //                     child: Text('Category $i'), // اصناف
          //                   ),
          //                 ),
          //               ),
          //           ],
          //         ),
          //       ),
          //       GridView.builder(
          //           shrinkWrap: true,
          //           physics: const NeverScrollableScrollPhysics(),
          //           gridDelegate:
          //               const SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2,
          //             mainAxisExtent: 240,
          //           ),
          //           itemCount: categorys.length,
          //           itemBuilder: (context, index) {
          //             return Card(
          //               child: const Padding(
          //                 padding: EdgeInsets.all(8.0),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.end,
          //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                   children: [
          //                     // Icon(
          //                     //   Icons.image,
          //                     //   size: 150,
          //                     // ),
          //                     // Image.network(
          //                     //   'http://192.168.54.119/shoppingTest/assets/productMainImage/${products[index].imagePath}',
          //                     //height: 150,
          //                     //width: 50,
          //                     //   fit: BoxFit.cover,
          //                     // ),
          //                     // Row(
          //                     //   children: [
          //                     //     Icon(
          //                     //       Icons.star,
          //                     //       size: 10,
          //                     //       color: Colors.orange,
          //                     //     ),
          //                     //     Icon(
          //                     //       Icons.star,
          //                     //       size: 10,
          //                     //       color: Colors.orange,
          //                     //     ),
          //                     //     Icon(
          //                     //       Icons.star,
          //                     //       size: 10,
          //                     //       color: Colors.orange,
          //                     //     ),
          //                     //     Icon(
          //                     //       Icons.star,
          //                     //       size: 10,
          //                     //       color: Colors.orange,
          //                     //     ),
          //                     //     Icon(
          //                     //       Icons.star_border,
          //                     //       size: 10,
          //                     //       color: Colors.orange,
          //                     //     ),
          //                     //     Icon(
          //                     //       Icons.star_border,
          //                     //       size: 10,
          //                     //       color: Colors.orange,
          //                     //     ),
          //                     //   ],
          //                     // ),
          //                     Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         // Text('oo'),
          //                         // Text(
          //                         //     '${products[index].title[context.locale.languageCode]}'),
          //                         // Text(
          //                         //     '${products[index].category.title[context.locale.languageCode]}'),

          //                         // Text('${products[index].title['en']}'),
          //                         // Text(
          //                         //     '${products[index].category.title['en']}'),
          //                       ],
          //                     ),
          //                     Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         //  Text('${products[index].brand.title}'),
          //                         //Text('\$ 50'),
          //                         // Text(
          //                         //   products[index].price.toString(),
          //                         //   style: TextStyle(
          //                         //       decoration: products[index].offer > 0
          //                         //           ? TextDecoration.lineThrough
          //                         //           : TextDecoration.none),
          //                         // ),
          //                         // if (products[index].offer > 0)
          //                         //   Text(products[index].offer.toString())
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             );
          //           })
          //     ],
          //   ),
          // ),

          Text('Favorite'),
          Text('Profile'),
        ],
      ),
    );
  }
}

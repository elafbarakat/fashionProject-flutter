import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/category.dart';
import '../../models/config.dart';
import '../../providers/category_provider.dart';
//import 'package:fashionproject/widgets/home/page_home.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  void initState() {
    // Provider.of<UserProvider>(context, listen: false).getUsersFN(
    //     name: 'name', email: 'email', phone: 'phone', password: 'password');

    super.initState();
    tst();
  }

  tst() async {
    await Provider.of<CategoryProvider>(context, listen: false)
        .getCategoryFN(brana_id: 1);
  }

  List<int> brandList = [];
  List<int> categoryList = [];
  @override
  Widget build(BuildContext context) {
    List<Categories> categorys =
        Provider.of<CategoryProvider>(context).getCategorys;
    return SingleChildScrollView(
      child: Column(
        children: [
          // Text('data'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    'lib/assets/images/rigester_image/image_1.png',
                    //height: 40,
                    //  width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    'lib/assets/images/rigester_image/image_2.png',
                    //height: 40,
                    //  width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < categorys.length; i++)
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Card(
                          margin: EdgeInsets.all(2),
                          color: const Color.fromRGBO(96, 125, 139, 1),
                          child: Column(
                            children: [
                              Text(
                                categorys[i].title['ar'],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  personlImagePath + categorys[i].image,
                                  height: 150,
                                ),
                              ),
                            ],
                          )

                          //   Icon(
                          //     Icons.account_box_rounded,
                          //     size: 200,
                          //   ),
                          ),
                    ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 15; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        brandList.contains(i)
                            ? brandList.removeWhere((element) => element == i)
                            : brandList.add(i);
                      });
                    },
                    child: Card(
                      shadowColor: Colors.blueGrey,
                      elevation: 10,
                      color: brandList.contains(i)
                          ? Colors.green
                          : Theme.of(context).cardColor,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Brand $i'), // ماركة او منتج
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 15; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        brandList.contains(i)
                            ? categoryList
                                .removeWhere((element) => element == i)
                            : categoryList.add(i);
                      });
                    },
                    child: Card(
                      shadowColor: Colors.blueGrey,
                      elevation: 10,
                      color: brandList.contains(i)
                          ? Colors.green
                          : Theme.of(context).cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Category $i'), // اصناف
                      ),
                    ),
                  ),
              ],
            ),
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 240,
              ),
              itemCount: categorys.length,
              itemBuilder: (context, index) {
                return Card(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Icon(
                        //   Icons.image,
                        //   size: 150,
                        // ),
                        // Image.network(
                        //   'http://192.168.54.119/shoppingTest/assets/productMainImage/${products[index].imagePath}',
                        //height: 150,
                        //width: 50,
                        //   fit: BoxFit.cover,
                        // ),
                        // Row(
                        //   children: [
                        //     Icon(
                        //       Icons.star,
                        //       size: 10,
                        //       color: Colors.orange,
                        //     ),
                        //     Icon(
                        //       Icons.star,
                        //       size: 10,
                        //       color: Colors.orange,
                        //     ),
                        //     Icon(
                        //       Icons.star,
                        //       size: 10,
                        //       color: Colors.orange,
                        //     ),
                        //     Icon(
                        //       Icons.star,
                        //       size: 10,
                        //       color: Colors.orange,
                        //     ),
                        //     Icon(
                        //       Icons.star_border,
                        //       size: 10,
                        //       color: Colors.orange,
                        //     ),
                        //     Icon(
                        //       Icons.star_border,
                        //       size: 10,
                        //       color: Colors.orange,
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text('oo'),
                            // Text(
                            //     '${products[index].title[context.locale.languageCode]}'),
                            // Text(
                            //     '${products[index].category.title[context.locale.languageCode]}'),

                            // Text('${products[index].title['en']}'),
                            // Text(
                            //     '${products[index].category.title['en']}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //  Text('${products[index].brand.title}'),
                            //Text('\$ 50'),
                            // Text(
                            //   products[index].price.toString(),
                            //   style: TextStyle(
                            //       decoration: products[index].offer > 0
                            //           ? TextDecoration.lineThrough
                            //           : TextDecoration.none),
                            // ),
                            // if (products[index].offer > 0)
                            //   Text(products[index].offer.toString())
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

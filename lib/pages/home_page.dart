import 'dart:async';

import 'package:essamar/bloc/bloc_product/product_bloc.dart';
import 'package:essamar/bloc/bloc_product/product_event.dart';
import 'package:essamar/bloc/bloc_product/product_state.dart';
import 'package:essamar/models/product_model.dart';
import 'package:essamar/pages/detail_page.dart';
import 'package:essamar/services/shared_prefrences_service.dart';
import 'package:essamar/utils/colors.dart';
import 'package:essamar/utils/layout.dart';
import 'package:essamar/widgets/bottom_curcular.dart';
import 'package:essamar/widgets/image_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  int page = 1;
  final TextEditingController _searchController = TextEditingController();
  bool _showDeleteIcon = false;

  void _clearTextField() {
    setState(() {
      _searchController.clear();
      _showDeleteIcon = false;
    });
  }

  int _currentPage = 0;
  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll ) {
      context.read<ProductsBloc>().add(GetProductEvent());
    }
  }

  @override
  void initState() {
    super.initState();
    _getFavourite();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }



void _addFavourite(Product product) async {
  // Perform asynchronous work here.
  product.isFavourite = true ;
  await MySharedPreferencesManager.addFavoriteProduct(product);
  // Update the state of the widget synchronously inside setState().
  
  setState(() {
    // Update the state of the widget here.
  });
}
void _removeFavourite(Product product) async {
  // Perform asynchronous work here.

  product.isFavourite = false ;
  await MySharedPreferencesManager.removeFavoriteProduct(product.id);
  // Update the state of the widget synchronously inside setState().

  setState(() {
    // Update the state of the widget here.
  });
}

late List<Product> favouriteProduct ;
void _getFavourite() async {
  favouriteProduct  = await MySharedPreferencesManager.getFavoriteProducts();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      ),
      body: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height - 150,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                //search textform
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: Layout.height(context, 50),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _showDeleteIcon = value.isNotEmpty;
                      });
                    },
                    textDirection: TextDirection.rtl,
                    controller: _searchController,
                    cursorColor: AppColors.mainColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 2),
                      hintTextDirection: TextDirection.rtl,
                      hintText: ' البحث عن المنتج بالاسم',
                      suffixIcon: const Icon(
                        Icons.search,
                        size: 35,
                        color: Colors.black,
                      ),
                      prefixIcon: InkWell(
                        onTap: _clearTextField,
                        child: Visibility(
                            visible: _showDeleteIcon, child: Icon(Icons.close)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                //page view AND Timer
                Container(
                    width: double.maxFinite,
                    height: Layout.height(context, 200),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Layout.radius(context, 15)),
                    ),
                    child: GestureDetector(
                      onLongPressStart: (details) {},
                      onLongPressEnd: (details) {},
                      child: Stack(
                        children: [
                          PageView(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Layout.radius(context, 15)),
                                    image: const DecorationImage(
                                        image: AssetImage('images/image1.jpg'),
                                        fit: BoxFit.fill)),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Layout.radius(context, 15)),
                                    image: const DecorationImage(
                                        image: AssetImage('images/image2.jpg'),
                                        fit: BoxFit.fill)),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: _currentPage == 0
                                      ? Colors.black
                                      : Colors.grey,
                                  size: 12,
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.circle,
                                  color: _currentPage == 1
                                      ? Colors.black
                                      : Colors.grey,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                //row altakhasusat
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "اكتشف التخصصات",
                        style:
                            TextStyle(fontSize: Layout.fontSize(context, 18)),
                      )
                    ],
                  ),
                ),
                //2 container
                Container(
                  width: double.maxFinite,
                  height: Layout.height(context, 180),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          children: [
                            Stack(children: [
                              Material(
                                borderRadius: BorderRadius.circular(
                                    Layout.radius(context, 15)),
                                elevation: 2.0,
                                child: Container(
                                  height: Layout.height(context, 160),
                                  width: Layout.width(context, 140),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Layout.radius(context, 15)),
                                      image: const DecorationImage(
                                          image:
                                              AssetImage('images/frommage.jpg'),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              const Positioned(
                                  bottom: 12,
                                  right: 8,
                                  child: Text("اجبان و البان"))
                            ]),
                            const SizedBox(
                              width: 12,
                            ),
                            Stack(children: [
                              Material(
                                borderRadius: BorderRadius.circular(
                                    Layout.radius(context, 15)),
                                elevation: 2.0,
                                child: Container(
                                  height: Layout.height(context, 160),
                                  width: Layout.width(context, 140),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Layout.radius(context, 15)),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'images/superMarcket.png'),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              const Positioned(
                                  bottom: 12,
                                  right: 8,
                                  child: Text("سوبر ماركت"))
                            ]),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //row iktachif al fi2at
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "اكتشف الفئات",
                        style:
                            TextStyle(fontSize: Layout.fontSize(context, 18)),
                      )
                    ],
                  ),
                ),
                //list view of categories
                Container(
                  width: double.maxFinite,
                  height: Layout.height(context, 110),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    children: List.generate(
                        9,
                        (index) => Container(
                              width: 90,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              child: Column(
                                children: [
                                  ImageCircle(
                                    imageUrl: 'https://picsum.photos/200',
                                    size: 75,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text("الفئة")
                                ],
                              ),
                            )),
                  ),
                ),
                //grid view of product
                BlocBuilder<ProductsBloc, ProductState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case ProductStatus.loading:
                        return const LoadingWidget();
                      case ProductStatus.success:
                        if (state.product.isEmpty) {
                          return const Center(
                            child: Text("No Posts"),
                          );
                        }
                       
                        return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.63,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount:state.hasReachedMax
                                ? state.product.length
                                : state.product.length + 1,
                            itemBuilder: (BuildContext context, int index)  {
                               
                             return index >= state.product.length 
                             ?Stack(children: [const Center(child: LoadingWidget(),)])
                             :GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                        imageUrl: state.product[index].imageUrl,
                                        title: state.product[index].title,
                                        price: state.product[index].price,
                                        description:
                                            state.product[index].description,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          width: 1, color: Colors.black54),
                                      color: Colors.white10),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: Layout.height(context, 140),
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'http://127.0.0.1:8000${state.product[index].imageUrl}'),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 3),
                                        width: double.maxFinite,
                                        height: 59,
                                        // color: Colors.green,
                                        child: Center(
                                          child: Text(
                                            state.product[index].title,
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize:
                                                  Layout.fontSize(context, 16),
                                            ),
                                            maxLines: 3,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              "${state.product[index].price}دج",
                                              style: TextStyle(
                                                  fontSize: Layout.fontSize(
                                                      context, 18),
                                                  fontWeight: FontWeight.bold),
                                              textDirection: TextDirection.rtl,
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children:  [
                                            const Icon(
                                              Icons.shopping_cart_outlined,
                                              color: Colors.black54,
                                              size: 26,
                                            ),
                                            GestureDetector(
                                              onTap: ()  {
                                            
                                                 if(state.product[index].isFavourite ?? false){
                                                  _removeFavourite(state.product[index]);
                                                 print('removed');
                                                 }else{
                                                  _addFavourite(state.product[index]);
                                                  print('add');
                                                 }
                                                
                                              },
                                              child:  Icon(
                                               state.product[index].isFavourite!  ?Icons.favorite_outlined:Icons.favorite_outline ,
                                                color: state.product[index].isFavourite!  ? AppColors.mainColor:null,
                                                size: 26,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }); 
                      case ProductStatus.error:
                        return Center(
                          child: Text(state.errorMessage),
                        );
                    }
                  },
                )
              ],
            )),
      ),
    );
  }
}



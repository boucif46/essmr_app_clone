import 'package:essamar/bloc/bloc_search_min_max/bloc/search_min_max_bloc.dart';
import 'package:essamar/utils/colors.dart';
import 'package:essamar/utils/constant.dart';
import 'package:essamar/utils/layout.dart';
import 'package:essamar/widgets/bottom_curcular.dart';
import 'package:essamar/widgets/search_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _showDeleteIcon = false;
  void _clearTextField() {
    setState(() {
      _searchController.clear();
      _showDeleteIcon = false;
    });
  }
 final _focusNode1 = FocusNode();
  @override
  void dispose() {
    _searchController.dispose();
    _focusNode1.dispose();
    super.dispose();
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
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: Layout.height(context, 50),
                child: TextField(
                  focusNode: _focusNode1,
                  onTapOutside:(value){
                     _focusNode1.unfocus();
                  },
                  onChanged: (value) {
                    setState(() {
                      _showDeleteIcon = value.isNotEmpty;
                    });
                  },
                  textDirection: TextDirection.rtl,
                  controller: _searchController,
                  cursorColor: AppColors.mainColor,
        
                  
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.black
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 2),
                    hintTextDirection: TextDirection.rtl,
                    hintText: ' البحث عن المنتج بالاسم',
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 35,
                      color: Colors.black,
                    ),
                    prefixIcon: IntrinsicWidth(
                      child: Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey,
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchSetting()));
                            },
                            child: Icon(Icons.tune_outlined,color: Colors.black54,))),
                        InkWell(
                          onTap: _clearTextField,
                          child: Visibility(
                              visible: _showDeleteIcon,
                              child: const Icon(Icons.close)),
                        ),
                      ],
                    ),
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
              BlocBuilder<SearchMinMaxBloc,SearchMinMaxState>(builder: (context,state){
                if(state is SearchMinMaxLoading){
                return const Center(child: LoadingWidget(),);
                }else if(state is SearchMinMaxLoaded){
                  return SizedBox(
                    width: double.maxFinite,
                  
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics:const  NeverScrollableScrollPhysics(),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin:const  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          padding: const EdgeInsets.all(8),
                          width: double.maxFinite,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 1,color: Colors.grey)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: double.maxFinite,
                                width: 200,
                                child: Column(
                                    children: [
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children:  [
                                      Text(state.products[index].title,
                                      style:const  TextStyle(
                                        color: Colors.black,
                                               fontSize: 16,
                                      ),),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children:  [
                                      Text("${state.products[index].price} دج ",
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold                                  
                                      ),),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children:const  [
                                        Icon(Icons.shopping_cart_checkout_outlined),
                                        Icon(Icons.favorite_border_outlined)
                                        ],
                                      )
                                    ],
                                ),
                              ),
                              Container(
                                width: 100,
                                height: double.maxFinite,
                                decoration:  BoxDecoration(
                                  borderRadius:const  BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12)
                                  ),
                                  image: DecorationImage(image: NetworkImage("http://127.0.0.1:8000${state.products[index].imageUrl}"),fit: BoxFit.cover)
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }else if(state is SearchMinMaxLoadingFailure){
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }else {
                  return Container();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:essamar/bloc/bloc_search_min_max/bloc/search_min_max_bloc.dart';
import 'package:essamar/utils/colors.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSetting extends StatefulWidget {
  const SearchSetting({super.key});

  @override
  State<SearchSetting> createState() => _SearchSettingState();
}

class _SearchSettingState extends State<SearchSetting> {
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();

  Color _iconColor = Colors.transparent;

  void _changeIconColor() {
    setState(() {
      _iconColor = AppColors.mainColor;
    });
  }

  List<List<String>> types = [
    [
      "سوبر ماركت",
      "مواد التنظيف",
      " و فاست فود",
    ],
    [
      "بقوليات",
      " و فاست فود",
      "سوبر ماركت",
    ],
    [
      "بقوليات",
      "مخبزة و حلويات",
      "مواد التنظيف",
    ],
    [
      "سوبر ماركت",
      "بقوليات",
      "مواد التنظيف",
    ],
    [
      "سوبر ماركت",
      "بقوليات",
      "مواد التنظيف",
    ],
    [
      " و فاست فود",
      "سوبر ماركت",
      "بقوليات",
    ]
  ];

  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  @override
  void dispose() {
    // Clean up the focus node when the widget is removed from the tree

    _focusNode1.dispose();
    _focusNode2.dispose();

    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  var selectedIndex = [
    [
      -1,
      -1,
      -1,
    ],
    [
      -1,
      -1,
      -1,
    ],
    [
      -1,
      -1,
      -1,
    ],
    [
      -1,
      -1,
      -1,
    ],
    [
      -1,
      -1,
      -1,
    ],
    [
      -1,
      -1,
      -1,
    ]
  ];

  String typeChoosen = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            const Text(
              "تصفيات",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_back,
              color: Colors.transparent,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "الفئات",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: List.generate(
                    6,
                    (index1) => Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: List.generate(3, (index2) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Select a new container and deselect the previous one
                                  selectedIndex = [
                                    [
                                      -1,
                                      -1,
                                      -1,
                                    ],
                                    [
                                      -1,
                                      -1,
                                      -1,
                                    ],
                                    [
                                      -1,
                                      -1,
                                      -1,
                                    ],
                                    [
                                      -1,
                                      -1,
                                      -1,
                                    ],
                                    [
                                      -1,
                                      -1,
                                      -1,
                                    ],
                                    [
                                      -1,
                                      -1,
                                      -1,
                                    ]
                                  ];
                                  selectedIndex[index1][index2] = 1;
                                  typeChoosen = const Text('gateau').data!;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[200],
                                    border: Border.all(
                                      width:
                                          (selectedIndex[index1][index2] == 1)
                                              ? 1
                                              : 0,
                                      color:
                                          (selectedIndex[index1][index2] == 1)
                                              ? AppColors.mainColor
                                              : Colors.grey,
                                    )),
                                child: IntrinsicWidth(
                                  child: Center(
                                    child: Text(types[index1][index2]),
                                  ),
                                ),
                              ),
                            );
                          }),
                        )),
              ),
            ),
            //textformNumber * 2
            Container(
              height: 100,
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 45, bottom: 40),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    Text("اعلى سعر"),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1.0, color: Colors.grey)),
                      child: Center(
                        child: TextField(
                          controller: _maxController,
                          textAlignVertical: TextAlignVertical.center,
                          focusNode: _focusNode1,
                          textAlign: TextAlign.center,
                          cursorHeight: 30,
                          cursorColor: AppColors.mainColor,
                          style: const TextStyle(fontSize: 20),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          onTapOutside: (value) {
                            _focusNode1.unfocus();
                          },
                        ),
                      ),
                    ),
                    Text("دج"),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text("ادنى سعر"),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1.0, color: Colors.grey)),
                      child: TextField(
                        controller: _minController,
                        focusNode: _focusNode2,
                        textAlign: TextAlign.center,
                        cursorHeight: 30,
                        cursorColor: AppColors.mainColor,
                        style: const TextStyle(fontSize: 20),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        onTapOutside: (value) {
                          _focusNode2.unfocus();
                        },
                      ),
                    ),
                    Text("دج"),
                  ],
                )
              ]),
            ),
            GestureDetector(
              onTap: () {
                if (!(typeChoosen == '' &&
                    _minController.text == '' &&
                    _maxController.text == '')) {
                  BlocProvider.of<SearchMinMaxBloc>(context).add(
                      GetProductbyMinMax(
                          minPrice: int.parse(_minController.text),
                          maxPrice: int.parse(_maxController.text),
                          tag: typeChoosen));
                  Navigator.pop(context);
                }
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.mainColor),
                child: const Center(
                  child: Text(
                    "تصفية",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1.0, color: AppColors.mainColor)),
              child: Center(
                child: Text(
                  "مسح التصفية",
                  style: TextStyle(color: AppColors.mainColor, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

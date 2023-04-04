import 'package:ecommerce_app_with_flutter/src/data/model/product_model.dart';
import 'package:ecommerce_app_with_flutter/src/presentation/screens/product_details/product_details.dart';
import 'package:ecommerce_app_with_flutter/src/services/api_call_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_bar_colors.dart';
import '../../../data/model/favorite/favorite_model.dart';
import '../../widgets/export_widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textController = TextEditingController();

  late List<ProductModel>? _products = [];
  String search = '';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _products = (await APICallService.getProduct());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: AppBarColors.darkIcons,
        leading: const BackButton(
          color: Colors.black54,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SearchBox(
          controller: _textController,
          autoFocus: true,
          onChange: (value) {
            setState(() {
              search = _textController.value.text;
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: _products == null || _products!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff76bbaa),
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: _textController.text.isEmpty
                          ? const Center(
                              child: Text('Search for a product'),
                            )
                          : Wrap(
                              children: List.generate(
                                _products!.length,
                                (index) {
                                  if (_products![index]
                                      .title
                                      .toLowerCase()
                                      .contains(search.toLowerCase())) {
                                    return Consumer<FavoriteModel>(
                                        builder: (_, favorie, child) {
                                      return ProductCard(
                                        addToFavorite: () {
                                          Provider.of<FavoriteModel>(_,
                                                  listen: false)
                                              .add(
                                            _products![index],
                                          );
                                        },
                                        isFavorite: favorie.items
                                                .contains(_products![index])
                                            ? false
                                            : true,
                                        onpress: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) => ProductDetails(
                                                productInfo: _products![index],
                                              ),
                                            ),
                                          );
                                        },
                                        producInfo: ProductModel(
                                          id: _products![index].id,
                                          title: _products![index].title,
                                          price: _products![index].price,
                                          description:
                                              _products![index].description,
                                          category: _products![index].category,
                                          image: _products![index].image,
                                          rating: Rating(
                                            rate: _products![index].rating.rate,
                                            count:
                                                _products![index].rating.count,
                                          ),
                                        ),
                                      );
                                    });
                                  }
                                  return Container();
                                },
                              ),
                            ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

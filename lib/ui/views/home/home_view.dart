import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:sample_provider_app/models/product/product_model.dart';
import 'package:sample_provider_app/ui/shared/app_colors.dart';
import 'package:sample_provider_app/ui/shared/ui_helper.dart';
import 'package:sample_provider_app/ui/views/home/home_view_model.dart';
import 'package:sample_provider_app/ui/views/home/widget/cart_grid_widget.dart';
import 'package:sample_provider_app/ui/views/home/widget/products_grid_widget.dart';
import 'package:sample_provider_app/ui/views/home/widget/search_widget.dart';
import 'package:sample_provider_app/ui/views/home/widget/slider_card_widget.dart';
import 'package:sample_provider_app/ui/widgets/busy_button.dart';
import 'package:sample_provider_app/ui/widgets/loading_widget.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
        onModelReady: (model) => model.init(context),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primary,
              centerTitle: true,
              leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: white,
                  ),
                  onPressed: () {}),
              title: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "e",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: white,
                      )),
                  TextSpan(
                      text: "Shop",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: white,
                      ))
                ]),
              ),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: white,
                    ),
                    onPressed: model.goToCart)
              ],
            ),
            bottomNavigationBar: model.cartProducts.length > 0
                ? Container(
                    height: 90.0,
                    padding: EdgeInsets.all(10.0),
                    color: primary,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return CartGridWidget(
                                productModel: model.cartProducts[index],
                              );
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: model.cartProducts.length,
                          ),
                        ),
                        horizontalSpaceTiny,
                        BusyButton(
                          title: 'Go to Cart',
                          width: 100.0,
                          onPressed: model.goToCart,
                          height: 40.0,
                        )
                      ],
                    ),
                  )
                : null,
            backgroundColor: white,
            body: model.loading
                ? LoadingWidget(
                    title: 'Loading',
                    message: 'Please wait',
                  )
                : Column(
                    children: <Widget>[
                      SearchWidget(),
                      verticalSpaceTiny,
//                      CarouselSlider(
//                        options: CarouselOptions(
//                          autoPlay: true,
//                          aspectRatio: 2.0,
//                          enlargeCenterPage: true,
//                        ),
//                        items: model.imgList
//                            .map((item) => SliderCardWidget(
//                                  url: item,
//                                ))
//                            .toList(),
//                      ),
//                      verticalSpaceTiny,
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio:
                              (model.itemWidth / model.itemHeight),
                          controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: model.products.map((ProductModel product) {
                            return ProductsGridWidget(
                              productModel: product,
                              onAddToCart: () => model.addToCart(product),
                              onRemoveFromCart: () => model.removeCart(product),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
          );
        },
        viewModelBuilder: () => HomeViewModel());
  }
}

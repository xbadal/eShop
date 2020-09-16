import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_provider_app/models/product/product_model.dart';
import 'package:sample_provider_app/ui/shared/ui_helper.dart';
import 'package:sample_provider_app/ui/widgets/busy_button.dart';

class ProductsGridWidget extends StatelessWidget {
  final ProductModel productModel;
  final Function onAddToCart;
  final Function onRemoveFromCart;

  const ProductsGridWidget(
      {Key key, this.productModel, this.onAddToCart, this.onRemoveFromCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productModel.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          verticalSpaceSmall,
          Text(
            productModel.name,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: <Widget>[
              RatingBarIndicator(
                rating: 4.5,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 12.0,
                ),
                itemCount: 5,
                itemSize: 12.0,
                unratedColor: Colors.grey[300],
                direction: Axis.horizontal,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                '4.5',
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                '(100)',
                maxLines: 1,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                ),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Rs. ${productModel.price}',
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              productModel.cartQuantity == 0
                  ? BusyButton(
                      title: 'Add',
                      width: 80.0,
                      onPressed: onAddToCart,
                      height: 30.0,
                    )
                  : Row(
                      children: [
                        BusyButton(
                          title: '+',
                          width: 25.0,
                          onPressed: onAddToCart,
                          height: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '${productModel.cartQuantity}',
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        BusyButton(
                          title: '-',
                          width: 25.0,
                          onPressed: onRemoveFromCart,
                          height: 30.0,
                        ),
                      ],
                    )
            ],
          ),
        ],
      ),
    );
  }
}

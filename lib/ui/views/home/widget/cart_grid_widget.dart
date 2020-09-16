import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_provider_app/models/product/product_model.dart';
import 'package:sample_provider_app/ui/shared/app_colors.dart';

class CartGridWidget extends StatelessWidget {
  final ProductModel productModel;

  const CartGridWidget({Key key, this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      width: 70.0,
      child: Stack(
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productModel.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16.0),
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '${productModel.cartQuantity}',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            top: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}

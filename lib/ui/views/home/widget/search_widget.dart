import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_provider_app/ui/shared/app_colors.dart';
import 'package:sample_provider_app/ui/shared/ui_helper.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 60.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: offWhite,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.search,
                color: black,
                size: 24.0,
              ),
              horizontalSpaceTiny,
              Text(
                'Search',
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

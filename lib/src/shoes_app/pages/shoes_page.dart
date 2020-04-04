import 'package:flutter/material.dart';
import 'package:flutter_design_practice/src/shoes_app/pages/shoe_details_page.dart';
import 'package:flutter_design_practice/src/shoes_app/widgets/widgets.dart';

class ShoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'For you'),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: 'shoes-hero',
                    child: ShoeView(
                      onTap: () {
                        Navigator.of(context).push(
                          FadeRoute<void>(
                            child: ShoeDetailsPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  const ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            ),
          ),
          const AddToCart(
            value: 180.0,
          ),
        ],
      ),
    );
  }
}

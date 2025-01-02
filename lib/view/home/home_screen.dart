import 'package:flutter/material.dart';
import 'package:submission/component/card_product.dart';
import 'package:submission/component/text/text_component.dart';
import 'package:submission/model/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: ListView(
        children: [
          heading2('Popular Product'),
          Container(
            height: 240,
            child: ListView.builder(
                itemCount: electronicProductList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idx) {
                  return CardProduct(
                    product: electronicProductList[idx],
                  );
                }),
          ),
          SizedBox(
            height: 12,
          ),
          heading2('data'),
          Container(
            height: 240,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idx) {
                  return CardProduct(
                    product: electronicProductList[idx],
                  );
                }),
          ),
          SizedBox(
            height: 12,
          ),
          heading2('data'),
          Container(
            height: 240,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idx) {
                  return CardProduct(
                    product: electronicProductList[idx],
                  );
                }),
          ),
          SizedBox(
            height: 12,
          ),
          heading2('data'),
          Container(
            height: 240,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idx) {
                  return CardProduct(
                    product: electronicProductList[idx],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

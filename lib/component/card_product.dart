import 'package:flutter/material.dart';
import 'package:submission/model/product.dart';
import 'package:submission/utils/color.dart';
import 'package:submission/view/product/detail_screen.dart';

class CardProduct extends StatelessWidget {
  final Product product;

  const CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox(
            width: 160,
            child: Card(
              color: const Color.fromARGB(255, 240, 240, 240),
                child: InkWell(
                  highlightColor: AppColors.borderColor,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductDetailScreen(product: product);
                }));
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image(image: AssetImage('images/image-1.jpg'))),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      product.formattedPrice,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product.name,
                      style: TextStyle(fontWeight: FontWeight.w500),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ))));
  }
}

// Widget cardProduct(BuildContext context) {
//   return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//           width: 150,
//           child: Card(
//               child: InkWell(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return ProductDetailScreen();
//               }));
//             },
//             borderRadius: BorderRadius.circular(12),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   ClipRRect(
//                       borderRadius: BorderRadius.circular(4),
//                       child: Image(image: AssetImage('images/image-1.jpg'))),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Text(
//                     'Rp 20.000.000',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'Title without subtitle or microtitle and detail',
//                     style: TextStyle(fontWeight: FontWeight.w500),
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//           ))));
// }

// }

// class CardProduct extends StatelessWidget {
//   const CardProduct({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 250,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: electronicProductList.map((Product product) {
//               return SizedBox(
//                   height: double.infinity,
//                   width: 150,
//                   child: Card(
//                       child: InkWell(
//                     onTap: () {},
//                     borderRadius: BorderRadius.circular(12),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Image(image: AssetImage(product.thumbnail)),
//                           Text('data'),
//                         ],
//                       ),
//                     ),
//                   )));
//             }).toList(),
//           ),
//         ),
//       );
//   }
// }


import 'package:flutter/material.dart';
import 'package:submission/component/button/elevated_button.dart';
import 'package:submission/component/button/outlined_button.dart';
import 'package:submission/component/divider/divider_component.dart';
import 'package:submission/component/youtube/video_player.dart';
import 'package:submission/model/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(
              bottom: false,
              child: Stack(children: <Widget>[
                AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image(
                      image: AssetImage(product.thumbnail),
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const FavoriteButton()
                    ],
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.formattedPrice,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    dividerComponent(
                      height: 20,
                    ),
                    Text(
                      product.description.isEmpty
                          ? 'Description not available.'
                          : product.description,
                      style: TextStyle(
                          fontStyle: product.description.isEmpty
                              ? FontStyle.italic
                              : FontStyle.normal),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Product Video',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 4,
                    ),
                    const VideoPlayer(),
                    dividerComponent(height: 24),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: SizedBox(
                            width: 48,
                            height: 48,
                            child: Image.asset(
                              'images/image-1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'shop name',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )
                      ],
                    ),
                    dividerComponent(height: 24),
                    // const VideoList(),
                    // const Text('review?'),
                    // const Icon(
                    //   Icons.star,
                    //   color: Color.fromARGB(255, 255, 160, 7),
                    // ),
                  ]),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButtonComponent(
                onPressed: () {},
                text: 'Add to cart',
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: ElevatedButtonComponent(
                onPressed: () {},
                text: 'Buy now',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}

void navigateToProductDetail(BuildContext context, Product product) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ProductDetailScreen(product: product),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  ));
}

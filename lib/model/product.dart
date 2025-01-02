import 'package:intl/intl.dart';

class Product {
  int id;
  String name;
  String description;
  String thumbnail;
  List<String> images;
  double price;
  double shadowPrice;
  int quantity = 1;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnail,
      required this.images,
      required this.price,
      required this.shadowPrice});

  String get formattedPrice {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    return formatCurrency.format(price);
  }
}

var electronicProductList = [
  Product(
      id: 1,
      name: 'Product 1',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      thumbnail: 'images/image-1.jpg',
      images: ['images/image-1.jpg'],
      price: 2012000,
      shadowPrice: 30000),
  Product(
      id: 2,
      name: 'Product This',
      description:
          'The quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog',
      thumbnail: 'images/image-1.jpg',
      images: ['images/image-1.jpg'],
      price: 2000,
      shadowPrice: 40000),
  Product(
      id: 3,
      name: 'Product 3',
      description: 'description',
      thumbnail: 'images/image-1.jpg',
      images: ['images/image-1.jpg'],
      price: 4000,
      shadowPrice: 50000),
  Product(
      id: 4,
      name: 'Kore wa',
      description:
          'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      thumbnail: 'images/image-1.jpg',
      images: ['images/image-1.jpg'],
      price: 2000000,
      shadowPrice: 60000),
  Product(
      id: 5,
      name: 'Product 5',
      description: '',
      thumbnail: 'images/image-1.jpg',
      images: ['images/image-1.jpg'],
      price: 99999999,
      shadowPrice: 70000),
];

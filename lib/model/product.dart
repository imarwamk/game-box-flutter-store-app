
class CartManager {
  static final List<Product> cart = [];
  static final List<Product> favorites = [];
  static final List<Product> topSellers = [
    Product(
      proimage: 'assets/ittakstwo.png',
      proname: 'It Taks Two',
      proprice: '80.00',
    ),
    Product(
      proimage: 'assets/blackops1.jpg',
      proname: 'Call of Duty: Black Ops 6',
      proprice: '215.00',
    ),
    Product(
      proimage: 'assets/lastofus.jpg',
      proname: 'The Last Of Us',
      proprice: '100.00',
    ),
    Product(
      proimage: 'assets/uncharted.jpg',
      proname: 'Uncharted | The Lost Legacy',
      proprice: '265.00',
    ),
  ];

  static final List<Product> bestOffers = [
    Product(
      proimage: 'assets/kirby.jpg',
      proname: 'Kirby',
      proprice: '265.00',
    ),
    Product(
      proimage: 'assets/mario.jpg',
      proname: 'Mario+Rabbids ',
      proprice: '100.00',
    ),
    Product(
      proimage: 'assets/dragon.jpg',
      proname: 'Dargon Ball',
      proprice: '265.00',
    ),
  ];

}


class Product {
  final String proname;
  final String proprice;
  final String proimage;

  Product({required this.proname, required this.proprice, required this.proimage});
}


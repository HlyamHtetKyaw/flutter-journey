class Product{
  final String name;
  final String description;
  final int price;
  final String image;
  Product(this.name,this.description,this.price,this.image);

  static List<Product> getProducts(){
    List<Product> items = <Product>[];
    items.add(Product("Babi","This is babi.", 1000, "babi.jpg"));
    items.add(Product("Baki", "This is baki", 2000, "baki.jpg"));
    items.add(Product("Dabi", "This is dabi", 3000, "dabi.jpg"));
    return items;
  }
}
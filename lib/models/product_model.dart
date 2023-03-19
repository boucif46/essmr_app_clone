class Product {
  int id;
  String imageUrl;
  String title;
  String tags;
  num price;
  String description;
  bool? isFavourite = false ;
  
  Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.tags,
    required this.price,
    required this.description,
    this.isFavourite
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(

      id: json['id'],
      imageUrl: json['image_url'],
      title: json['title'],
      tags: json['tags'], 
      price: json['price'],
      description: json['description'],
      isFavourite:json['isFavourite'] ?? false
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
      'title': title,
      'tags': tags,
      'price': price,
      'description': description,
      'isFavourite':isFavourite
    };
}

}

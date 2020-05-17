class Store {
  List<dynamic> address;
  String description;
  List<dynamic> deal;
  String business;
  String title;
  String img;

  Store(this.address, this.description, this.deal, this.business, this.title, this.img);

  Store.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    description = json['description'];
    deal = json['deal'];
    business = json['business'];
    title = json['title'];
    img = json['img'];
  }
}

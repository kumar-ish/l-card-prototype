class Store {
  String title;
  String text;
  String img;
  String address;

  Store(this.title, this.text, this.img, this.address);

  Store.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
    img = json['img'];
    address = json['address'];
  }
}

//
//
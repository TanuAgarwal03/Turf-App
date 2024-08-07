class PriceRangeModel{
  String? priceRange;
  int? id;
  PriceRangeModel(this.priceRange,this.id);
}
// class PriceRangeModel {
//   int? id;
//   String? price;

//   PriceRangeModel(String s, int i, 
//       {this.id,
//       this.price,});

//   PriceRangeModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'] ?? 1;
//     price = json['acf']['price'] ?? 'unknown';
//   }
// }

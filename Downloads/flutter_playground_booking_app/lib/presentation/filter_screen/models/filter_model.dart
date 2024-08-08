import 'package:flutter_playground_booking_app/presentation/filter_screen/models/price_range_model.dart';

// import 'ground_type_model.dart';

/// This class defines the variables used in the [filter_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FilterModel {
 static List<PriceRangeModel> getPriceList(){
   return [
     PriceRangeModel("\$100.00 To \$150.00 ",1),
      PriceRangeModel("\$150.00 To \$300.00 ",2),
      PriceRangeModel("\$300.00 To \$450.00 ",3),
      PriceRangeModel("\$450.00 To \$600.00 ",4),
      PriceRangeModel("\$600.00 To \$750.00 ",5),
      PriceRangeModel("\$750.00 To \$1000.00 ",6),
   ];
 }

//  static List<GroundTypeModel> getGroundTypeDataList(){
//    return [
//      GroundTypeModel("All",1),
//       GroundTypeModel("5A",2),
//       GroundTypeModel("7A",3),
//       GroundTypeModel("Futsal",4),
//    ];
//  }
}

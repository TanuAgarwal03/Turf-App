import 'package:flutter_playground_booking_app/presentation/filter_screen/models/price_range_model.dart';

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
}

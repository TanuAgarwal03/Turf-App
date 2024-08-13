import 'package:flutter_playground_booking_app/presentation/filter_screen/models/price_range_model.dart';

class FilterModel {
 static List<PriceRangeModel> getPriceList(){
   return [
    PriceRangeModel("\$100.00 To \$250.00 ",1),
      PriceRangeModel("\$250.00 To \$400.00 ",2),
      PriceRangeModel("\$400.00 To \$550.00 ",3),
      PriceRangeModel("\$550.00 To \$700.00 ",4),
      PriceRangeModel("\$700.00 To \$850.00 ",5),
      PriceRangeModel("\$850.00 To \$1000.00 ",6),
      PriceRangeModel("\$1000.00 To \$1150.00 ",7),
      PriceRangeModel("\$1150.00 To \$1300.00 ",8),
      PriceRangeModel("\$1300.00 To \$1450.00 ",9),
      PriceRangeModel("\$1450.00 To \$2000.00 ",10),
   ];
 }
}

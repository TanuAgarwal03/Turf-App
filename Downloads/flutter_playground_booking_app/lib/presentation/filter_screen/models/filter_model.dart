import 'package:flutter_playground_booking_app/presentation/filter_screen/models/price_range_model.dart';

class FilterModel {
 static List<PriceRangeModel> getPriceList(){
   return [
    //  PriceRangeModel("\$00.00 To \$200.00 ",1),
    //   PriceRangeModel("\$200.00 To \$400.00 ",2),
    //   PriceRangeModel("\$400.00 To \$600.00 ",3),
    //   PriceRangeModel("\$600.00 To \$800.00 ",4),
    //   PriceRangeModel("\$800.00 To \$1000.00 ",5),
    //   PriceRangeModel("\$1000.00 To \$1200.00 ",6),
    //   PriceRangeModel("\$1200.00 To \$1400.00 ",7),
    //   PriceRangeModel("\$1400.00 To \$2000.00 ",8),
    PriceRangeModel("\$100.00 To \$250.00 ",1),
      PriceRangeModel("\$250.00 To \$400.00 ",2),
      PriceRangeModel("\$400.00 To \$550.00 ",3),
      PriceRangeModel("\$550.00 To \$700.00 ",4),
      PriceRangeModel("\$700.00 To \$850.00 ",5),
      PriceRangeModel("\$850.00 To \$1000.00 ",6),
      PriceRangeModel("\$1000.00 To \$1150.00 ",7),
      PriceRangeModel("\$1150.00 To \$1300.00 ",8),
      PriceRangeModel("\$1300.00 To \$1500.00 ",9),
      PriceRangeModel("\$1500.00 To \$2000.00 ",10),
   ];
 }
}

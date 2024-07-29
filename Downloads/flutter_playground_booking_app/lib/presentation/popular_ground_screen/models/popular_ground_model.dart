import '../../../core/app_export.dart';
import 'popularground_item_model.dart';

/// This class defines the variables used in the [popular_ground_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PopularGroundModel {

  static List<PopulargroundItemModel> getPopularGroundData(){
    return [
      PopulargroundItemModel(ImageConstant.imgRectangle3463279181x388,"Hover ground", "Fairfield", false, false, true),
      PopulargroundItemModel(ImageConstant.imgRectangle3463279126x260,"Sport ground", "Banglore", false, true, true),
      PopulargroundItemModel(ImageConstant.imgRectangle34632791,"Futsal ground", "Fairfield",false, true,true),
      PopulargroundItemModel(ImageConstant.imgRectangle34632792,"Unique blend each", "Viet nam", false, false, true),

    ];
  }

}

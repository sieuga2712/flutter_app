import 'package:appdautien/common/bindings/base_binding.dart';
import 'package:appdautien/screen/page1/page1_controller.dart';

class Page1Binding extends BaseBinding {
  late Page1Controller _page1Controller;

  @override
  void onInit() {
    super.onInit();
    _page1Controller = Page1Controller();
  }

  @override
  void onReady() {
    super.onReady();
    // Initialize page-specific data if needed
    _initializePageData();
  }

  @override
  void onDispose() {
    super.onDispose();
    _page1Controller.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    // Clean up any resources
    _cleanupResources();
  }

  /// Get the page1 controller instance
  Page1Controller get page1Controller => _page1Controller;

  /// Initialize page-specific data
  void _initializePageData() {
    // Set default values or load from storage
    _page1Controller.setSelectedColor('Blue');
    _page1Controller.setSliderValue(50.0);
    _page1Controller.setSwitchValue(false);
    _page1Controller.setSelectedDate('Chưa chọn ngày');
  }

  /// Clean up resources
  void _cleanupResources() {
    // Save any important data before disposing
    // For example, save user preferences
  }

  /// Reset page to default state
  void resetPage() {
    _page1Controller.setSelectedColor('Blue');
    _page1Controller.setSliderValue(50.0);
    _page1Controller.setSwitchValue(false);
    _page1Controller.setSelectedDate('Chưa chọn ngày');
  }

  /// Get current page state
  Map<String, dynamic> getPageState() {
    return {
      'selectedColor': _page1Controller.selectedColor,
      'sliderValue': _page1Controller.sliderValue,
      'switchValue': _page1Controller.switchValue,
      'selectedDate': _page1Controller.selectedDate,
    };
  }

  /// Restore page state
  void restorePageState(Map<String, dynamic> state) {
    if (state.containsKey('selectedColor')) {
      _page1Controller.setSelectedColor(state['selectedColor']);
    }
    if (state.containsKey('sliderValue')) {
      _page1Controller.setSliderValue(state['sliderValue'].toDouble());
    }
    if (state.containsKey('switchValue')) {
      _page1Controller.setSwitchValue(state['switchValue']);
    }
    if (state.containsKey('selectedDate')) {
      _page1Controller.setSelectedDate(state['selectedDate']);
    }
  }
}

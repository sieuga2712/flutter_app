/// Application constants for better maintainability
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // Authentication
  static const String demoUsername = 'admin';
  static const String demoPassword = '123456';
  
  // Routes
  static const String routeLogin = '/login';
  static const String routeHome = '/home';
  static const String routePage1 = '/page1';
  static const String routePage2 = '/page2';
  static const String routePage3 = '/page3';
  
  // Page titles
  static const String titleHome = 'Trang Chủ';
  static const String titlePage1 = 'Page 1 - Settings';
  static const String titlePage2 = 'Page 2 - Counter';
  static const String titlePage3 = 'Page 3 - Todo List';
  
  // Validation
  static const int minUsernameLength = 3;
  static const int minPasswordLength = 6;
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;
  static const double defaultElevation = 4.0;
  
  // Animation durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Network
  static const Duration networkTimeout = Duration(seconds: 30);
  
  // Storage keys
  static const String keyUserPreferences = 'user_preferences';
  static const String keyAuthToken = 'auth_token';
  static const String keyThemeMode = 'theme_mode';
}

/// Route names enum for type safety
enum RouteName {
  login(AppConstants.routeLogin),
  home(AppConstants.routeHome),
  page1(AppConstants.routePage1),
  page2(AppConstants.routePage2),
  page3(AppConstants.routePage3);
  
  const RouteName(this.path);
  final String path;
}

/// Page titles enum
enum PageTitle {
  home(AppConstants.titleHome),
  page1(AppConstants.titlePage1),
  page2(AppConstants.titlePage2),
  page3(AppConstants.titlePage3);
  
  const PageTitle(this.title);
  final String title;
}

/// Validation messages
class ValidationMessages {
  static const String usernameRequired = 'Vui lòng nhập tên đăng nhập';
  static const String usernameTooShort = 'Tên đăng nhập phải có ít nhất 3 ký tự';
  static const String passwordRequired = 'Vui lòng nhập mật khẩu';
  static const String passwordTooShort = 'Mật khẩu phải có ít nhất 6 ký tự';
  static const String invalidCredentials = 'Tên đăng nhập hoặc mật khẩu không đúng';
}

/// Success messages
class SuccessMessages {
  static const String loginSuccess = 'Đăng nhập thành công!';
  static const String messageUpdated = 'Tin nhắn đã được cập nhật!';
  static const String todoAdded = 'Công việc đã được thêm!';
  static const String todoCompleted = 'Công việc đã hoàn thành!';
  static const String todoDeleted = 'Công việc đã được xóa!';
}

/// Error messages
class ErrorMessages {
  static const String networkError = 'Lỗi kết nối mạng';
  static const String unknownError = 'Đã xảy ra lỗi không xác định';
  static const String loginFailed = 'Đăng nhập thất bại';
  static const String saveFailed = 'Lưu dữ liệu thất bại';
}

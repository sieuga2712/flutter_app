# Router System với Header Bar - Flutter Demo App

## Tổng quan
Đã triển khai hệ thống routing mới với header_bar làm layout gốc. Tất cả các trang sẽ được hiển thị bên trong header_bar với navigation drawer và bottom navigation bar.

## Kiến trúc Router System

### 🏗️ Cấu trúc thư mục
```
lib/
├── common/
│   ├── router/
│   │   └── main_router.dart          # Main router với header_bar
│   ├── header_bar.dart             # Layout gốc với header
│   └── navigation_drawer_with_router.dart # Navigation drawer mới
└── screen/
    └── main_app/
        └── main_app_with_router.dart # Main app với router
```

## Các thành phần chính

### 🎛️ MainRouter
**Chức năng:**
- Quản lý routing với header_bar làm layout gốc
- Route history management
- Navigation state management
- Route configuration

**API chính:**
```dart
// Navigation
void navigateTo(String route, {bool addToHistory = true})
void goBack()
void resetToHome()

// State
String get currentRoute
List<String> get routeHistory
bool get canGoBack

// Configuration
RouteConfig? getCurrentRouteConfig()
Map<String, RouteConfig> get allRoutes
```

### 🏠 HeaderAppbar (Layout Gốc)
**Chức năng:**
- Layout chính cho tất cả các trang
- AppBar với title động
- Navigation drawer
- Bottom navigation bar
- Network status handling
- Back button với history

**Tính năng:**
- Responsive design
- Dynamic title từ route config
- Conditional drawer và bottom nav
- Logo support
- Back navigation với history

### 📱 MainAppWithRouter
**Chức năng:**
- StatefulWidget để quản lý router state
- Rebuild khi route thay đổi
- Integration với binding system
- Navigation callback handling

**Lifecycle:**
```dart
initState() → Initialize router → Initialize page bindings
build() → Get current route config → Render HeaderAppbar
```

### 🧭 AppNavigationDrawerWithRouter
**Chức năng:**
- Navigation drawer với router integration
- Route highlighting
- Authentication integration
- Debug information
- Router information

**Tính năng:**
- Current route highlighting
- Route navigation với callback
- Auth controller integration
- Binding info display
- Router info display

## Route Configuration

### 📋 RouteConfig Class
```dart
class RouteConfig {
  final String title;           // Title hiển thị trên AppBar
  final Widget page;            // Widget của trang
  final bool showDrawer;        // Hiển thị drawer
  final bool showBottomNav;     // Hiển thị bottom nav
  final String? logoPath;       // Logo path
  final Function()? onBackButtonPressed; // Back button callback
}
```

### 🗺️ Available Routes
```dart
'/home'   → HomePage (Trang chủ)
'/page1'  → Page1View (Settings)
'/page2'  → Page2View (Counter)
'/page3'  → Page3View (Todo List)
```

## Luồng hoạt động

### 1. App Initialization
```
App Start → Login → MainAppWithRouter → HeaderAppbar Layout
```

### 2. Route Navigation
```
User taps menu → NavigationDrawer → Router.navigateTo() → setState() → Rebuild
```

### 3. Page Rendering
```
Route change → getCurrentRouteConfig() → HeaderAppbar with new page
```

### 4. Back Navigation
```
Back button → Router.goBack() → setState() → Previous route
```

## Tính năng nổi bật

### 🎯 Header Bar Layout
- **Consistent UI:** Tất cả trang có cùng layout
- **Dynamic Title:** Title thay đổi theo route
- **Navigation Integration:** Drawer và bottom nav
- **Back Button:** Smart back navigation với history

### 🔄 Router Management
- **Route History:** Lưu trữ lịch sử navigation
- **State Management:** Rebuild khi route thay đổi
- **Configuration:** Flexible route configuration
- **Navigation:** Programmatic navigation

### 🧭 Navigation Features
- **Current Route Highlighting:** Route hiện tại được highlight
- **Route Information:** Debug info về router
- **Authentication Integration:** Logout functionality
- **Binding Integration:** Binding info display

### 📱 User Experience
- **Smooth Navigation:** Seamless page transitions
- **Consistent Layout:** Uniform experience across pages
- **Smart Back Button:** Intelligent back navigation
- **Visual Feedback:** Current route highlighting

## Integration với Binding System

### 🔗 Binding Integration
- **Page Bindings:** Tự động khởi tạo khi vào main app
- **Controller Management:** Controllers được quản lý bởi bindings
- **State Persistence:** Page state được lưu trữ
- **Memory Management:** Automatic cleanup

### 🎛️ Debug Features
- **Binding Info:** Hiển thị thông tin bindings
- **Router Info:** Hiển thị thông tin router
- **Route History:** Xem lịch sử navigation
- **Active Routes:** Danh sách routes available

## Cách sử dụng

### Navigation trong Code
```dart
// Navigate to route
MainRouter().navigateTo('/page1');

// Go back
MainRouter().goBack();

// Reset to home
MainRouter().resetToHome();
```

### Adding New Route
```dart
// 1. Add route to _routes map
'/newpage': RouteConfig(
  title: 'New Page',
  page: NewPageView(),
  showDrawer: true,
  showBottomNav: true,
),

// 2. Add navigation item in drawer
_buildNavigationItem(
  context,
  icon: Icons.new_page,
  title: 'New Page',
  route: '/newpage',
),
```

### Customizing Route
```dart
RouteConfig(
  title: 'Custom Page',
  page: CustomPageView(),
  showDrawer: true,
  showBottomNav: false,
  logoPath: 'assets/logo.png',
  onBackButtonPressed: () {
    // Custom back action
  },
)
```

## Lợi ích của Router System

### ✅ Consistent Layout
- **Uniform Experience:** Tất cả trang có cùng layout
- **Professional Look:** Header bar với navigation
- **Responsive Design:** Adapts to different screen sizes

### ✅ Navigation Management
- **Route History:** Smart back navigation
- **State Persistence:** Maintains navigation state
- **Programmatic Control:** Full control over navigation

### ✅ Developer Experience
- **Easy Configuration:** Simple route setup
- **Debug Tools:** Built-in debugging features
- **Type Safety:** Compile-time route checking
- **Maintainable Code:** Clean separation of concerns

### ✅ User Experience
- **Smooth Navigation:** Seamless page transitions
- **Visual Feedback:** Current route highlighting
- **Intuitive Back Button:** Smart back navigation
- **Consistent Interface:** Familiar navigation pattern

## Monitoring & Debugging

### Router Information
- Truy cập qua navigation drawer → "Router Info"
- Hiển thị current route
- Route history
- Available routes
- Navigation state

### Binding Information
- Truy cập qua navigation drawer → "Binding Info"
- Active bindings count
- Binding details
- Authentication status

## Kết luận
Router system với header_bar đã được triển khai hoàn chỉnh với:
- ✅ Header bar làm layout gốc
- ✅ Router management với history
- ✅ Navigation drawer integration
- ✅ Binding system integration
- ✅ Debug tools
- ✅ Consistent user experience
- ✅ Professional layout

Hệ thống này cung cấp một foundation mạnh mẽ cho ứng dụng Flutter với navigation chuyên nghiệp và user experience tốt.

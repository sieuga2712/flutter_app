# Mô tả các trang trong Flutter App

## Tổng quan
Ứng dụng Flutter Demo với 3 trang chính, mỗi trang có chức năng riêng biệt và sử dụng kiến trúc MVC (Model-View-Controller).

## Cấu trúc dự án
```
lib/
├── main.dart                    # Entry point của ứng dụng
├── app_router.dart             # Định nghĩa routes cho các trang
├── common/
│   ├── navigation_drawer.dart  # Navigation drawer để điều hướng
│   └── core/
│       ├── app_color.dart     # Định nghĩa màu sắc
│       └── app_string.dart    # Định nghĩa chuỗi
└── screen/
    ├── page1/                  # Trang cài đặt
    │   ├── page1_controller.dart
    │   └── page1_view.dart
    ├── page2/                  # Trang đếm số
    │   ├── page2_controller.dart
    │   └── page2_view.dart
    └── page3/                  # Trang danh sách công việc
        ├── page3_controller.dart
        └── page3_view.dart
```

## Chi tiết các trang

### 1. Page 1 - Settings (Trang Cài Đặt)
**Chức năng:**
- Chọn màu chủ đề từ 5 màu có sẵn (Blue, Red, Green, Purple, Orange)
- Điều chỉnh giá trị bằng slider (0-100)
- Bật/tắt chế độ nâng cao bằng switch
- Chọn ngày từ date picker
- Hiển thị tóm tắt tất cả cài đặt

**Tính năng nổi bật:**
- Giao diện đẹp với gradient và card design
- Tương tác real-time với các control
- Responsive design
- Tóm tắt cài đặt tự động cập nhật

### 2. Page 2 - Counter (Trang Đếm Số)
**Chức năng:**
- Đếm số với nút tăng/giảm/reset
- Hiển thị tin nhắn có thể tùy chỉnh
- Cập nhật tin nhắn với input field
- Thông báo khi cập nhật thành công

**Tính năng nổi bật:**
- State management với ChangeNotifier
- Giao diện thân thiện với người dùng
- Validation input
- Snackbar thông báo

### 3. Page 3 - Todo List (Trang Danh Sách Công Việc)
**Chức năng:**
- Thêm công việc mới
- Đánh dấu hoàn thành/chưa hoàn thành
- Xóa công việc
- Xóa tất cả công việc đã hoàn thành
- Xóa tất cả công việc
- Tải lại danh sách (simulation)
- Hiển thị số lượng công việc

**Tính năng nổi bật:**
- CRUD operations đầy đủ
- Visual feedback với icons
- Empty state handling
- Loading state simulation
- Responsive list design

## Navigation
- **Navigation Drawer:** Menu bên trái để điều hướng giữa các trang
- **App Bar:** Hiển thị tiêu đề trang và menu
- **Home Screen:** Trang chủ với hướng dẫn sử dụng

## Kiến trúc
- **MVC Pattern:** Tách biệt logic (Controller) và giao diện (View)
- **State Management:** Sử dụng ChangeNotifier và AnimatedBuilder
- **Reusable Components:** Các widget có thể tái sử dụng
- **Clean Code:** Code được tổ chức rõ ràng và dễ bảo trì

## Cách sử dụng
1. Mở ứng dụng sẽ thấy trang chủ
2. Nhấn vào menu (hamburger icon) để mở navigation drawer
3. Chọn trang muốn xem từ danh sách
4. Tương tác với các tính năng trên mỗi trang

## Công nghệ sử dụng
- **Flutter:** Framework chính
- **Material Design:** Thiết kế giao diện
- **State Management:** ChangeNotifier pattern
- **Navigation:** Drawer navigation
- **UI Components:** Material Design components

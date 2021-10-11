# matech-ios-project-structure
- Cấu trúc folder của dự án cơ bản sẽ giống như trong ví dụ, nếu dự án có các folder riêng cần tạo có thể tạo thêm dựa trên cấu trúc sẵn có. Bao gồm
   - Model: Chứa tất cả các file xử lý data như model file, data manager, ví dụ: SettingManager
     - Manager: Chứa các file logic để get data
     - Entity: Chứa các struct hoặc class để mô tả một entity
     - Constant: File này sẽ chứa các hằng số sử dụng trong app
         - class API: Sẽ chứa các constant để get data từ trên server về
         - class AdsConstant: chứa các constant AdMob
         - class AboutApp: Chứa các hằng số dùng trong app như APP_GROUP
   - Resource: Chứa các file resource như font, icon, color
       - Video: Chứa các video resource dùng trong dự án
       - JSONFile: Chứa các json file dùng trong dự án
       - Font:
           - Khi khái báo một font mới thì sẽ phải copy file font vào thư mục này sau đó khái báo tên font vào class FontAsset để có thể gọi trong code.
       - ColorAsset: Để khai báo một màu cần làm:
           - Thêm color vào Color.xcassets để có thể gọi trong Interface Builder
           - Khai báo tên màu vào class ColorAsset để sử dụng trong code
           - Chú ý: Màu và tên các màu sử dụng trong app sẽ được bộ phận design rõ và phải khai báo tên và mã màu tương ứng với design
       - ImageAsset: Để thêm một image vào app cần làm:
           -  Thêm ảnh, icon vào Assets.xcassets để có thể gọi trong Interface Builder
           -  Khai báo tên ảnh vào class ImageAsset để sử dụng trong code
    - Constrolles:
        - Khi tạo ViewController phải tạo một folder và để file .xib và file quản trị trong folder vừa tạo
   - View:
       - Custom: Chứa các view tự custom
       - Cell: Chứa các file .xib và file quả trị cho các cell của table view hoặc collection view.
   - Support: Chứa extension, file utils, file .plist
       - Extension: Chứa các extension để viết những hàm chung cho các component
       - Utils: Sẽ chứa các hàm không thuộc về entity nào được dùng chung trong dự án.
      

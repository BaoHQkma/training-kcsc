Decompile file ra ta thấy được:

<img width="489" alt="Screenshot_20230224_112340" src="https://user-images.githubusercontent.com/125690279/221245088-df687176-7aca-453d-a6a9-a9ea09baa680.png">

char được khai báo với 80 byte nhưng hàm gets lại nhận vô hạn byte, nên xảy ra lỗi buffer overflow.

GDB file ra ta thấy: 

<img width="382" alt="Screenshot_20230224_112808" src="https://user-images.githubusercontent.com/125690279/221245682-fed499cb-a852-4e88-afb1-b8fae3974e20.png">

- Địa chỉ binary của file là địa chỉ tĩnh.
- Trong file không tồn tại địa chỉ của /bin/sh.
=> Ta phải dùng ROPchain để tạo dữ liệu shell.

<img width="331" alt="Screenshot_20230225_123728" src="https://user-images.githubusercontent.com/125690279/221249326-7b0a3ecd-3ca3-418c-ba45-1842315c938c.png">

- Dùng ROPgadget để tìm địa chỉ các hàm arg, syscall,... trong chương trình.

- Dùng GDP để tìm khoảng trống dữ liệu để nhập vào các câu lệnh của mình.

<img width="388" alt="Screenshot_20230225_123938" src="https://user-images.githubusercontent.com/125690279/221249915-7e973156-9cc6-4f73-8002-e0638ecf6284.png">

Chạy script, lấy pid và attach vào file bằng GDB ta có thể thấy được các dữ liệu đang được rewrite

Các kết quả checksec:

<img width="612" alt="Screenshot_20230225_124923" src="https://user-images.githubusercontent.com/125690279/221252670-51e9f437-9881-4f9d-919b-36b55c0de4a7.png">

1. RELRO:
  - Ngăn chặn việc ghi đè lên các cấu trúc dữ liệu quan trọng hoặc các con trỏ hàm bằng cách thay đổi Global Offset Table (GOT) và Procedure Linkage Table (PLT) thành read-only.
  - Có 2 mode:
    + Partial RELRO: Ở mode này, chỉ có Global Offset Table (GOT) là được chuyển thành read-only.
    + Full RELRO: Ở mode này, cả Global Offset Table (GOT) và Procedure Linkage Table (PLT) được chuyển thành read-only.
2. Stack canary:
  - Ngăn chặn các cuộc tấn công stack lợi dụng lỗi buffer overflow bằng cách đặt 1 giá trị nhỏ ngẫu nhiên gọi là "canary" giữa các biến local và địa chỉ return trên stack.
  - Khi 1 hàm sắp return, nó sẽ kiểm tra giá trị canary xem thử là giá trị đã bị ghi đè chưa, nếu đã bị ghi đè, phần mềm sẽ thoát hoặc crash.
3. NX:
  - Ngăn chặn việc thực thi mã từ các trang dữ liệu bằng cách đánh dấu cho các trang dữ liệu không thực thi được, điều này khiến cho hacker không thể inject và chạy mã độc trong bộ nhớ.
4. PIE:
  - Khiến cho các code và dữ liệu trong file được load vào có địa chỉ ngẫu nhiên cho mỗi lần chạy, điều này làm cho các hacker khó mà có thể tìm được vị trí của các code hoặc dữ liệu quan trọng để tấn công.

Stack frame:
  - Stack frame là một cấu trúc dữ liệu được sử dụng trong lập trình máy tính để quản lý các 'call' và 'return' của các hàm.
  - Khi 1 function được call, 1 stack frame mới được tạo ra và được đẩy vào stack của chương trình.
  - Stack frame chứa tất cả các thông tin về function như:
    + Argument
    + Địa chỉ return
    + Các biến local
  - Khi hàm được chạy, nó sử dụng và cập nhật các biến cục bộ trong khung stack của nó.
  - Khi hàm return, stack frame của nó được đẩy khỏi stack và trở lại hàm call tại địa chỉ return được lưu trữ trong stack frame.

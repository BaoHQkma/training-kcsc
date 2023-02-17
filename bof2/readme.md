Như bài trước, ta decompile file bằng IDA:

<img width="459" alt="Screenshot_20230218_015226" src="https://user-images.githubusercontent.com/125690279/219759184-5885283a-8011-47f3-b8b9-09af32c603ec.png">

- Ta thấy không có gì khác biệt so với bài bof1, ngoại trừ dòng 21.
- Giờ đây, để lấy được shell, ta cần phải nhập số liệu giống với v5, v6 và v7. Nhưng đó đều là những kí tự impossible để nhập tay như thông thường.
=> Phải dùng tới PWN Tools.

<img width="553" alt="Screenshot_20230218_021539" src="https://user-images.githubusercontent.com/125690279/219766736-dea49f81-3905-4f48-b113-da9cf9de7dd0.png">

- Ta sử dụng payload để điền trước 16 byte của char buf và điền lần lượt các ký tự đặc biệt vào v5, v6, v7 (phải dùng p64 để pack các kí tự đó thành kí tự 64-bit vì a, b, c là biến 64-bit).
- Sau đó dùng p.sendafter() để gửi mấy cái payload này vào dữ liệu sau kí tự '> ' ở hàng 14.

=> Chạy file .py ta được shell của bài 

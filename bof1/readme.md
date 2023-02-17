Sau khi decompile file bằng IDA ta thấy:

<img width="395" alt="IDA_Screenshot" src="https://user-images.githubusercontent.com/125690279/219752012-da76dcef-d766-440f-9508-3e89e7de521a.png">

- Lỗi buffer overflow xảy ra tại mảng char buf, khi nó chỉ có 16 byte nhưng hàm read() lại đọc tới 48 byte.
- Shell sẽ được lấy khi v5 & v6 & v7 khác 0.

=> Chỉ cần nhập input sao cho byte tràn tới v7. 
- Ta có char buf = 16 byte, v5 = v6 = v7 = 8 byte, vậy lượng byte cần nhập sẽ là 40.

<img width="345" alt="Screenshot_20230218_013822" src="https://user-images.githubusercontent.com/125690279/219756163-fa49e501-20d9-4c31-854b-00a521f5c958.png">

Sau khi nhập xong ta dùng lệnh 'ls' và vẫn thấy được tên file, điều đó cho thấy ta đã lấy được shell.

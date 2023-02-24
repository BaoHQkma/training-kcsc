Decompile file ra ta thấy:

Mục win:

<img width="288" alt="Screenshot_20230224_073717" src="https://user-images.githubusercontent.com/125690279/221180957-227b7072-e824-4a6f-bbf7-9a2e911b0036.png">

Mục main:

<img width="431" alt="Screenshot_20230224_073638" src="https://user-images.githubusercontent.com/125690279/221180965-fe2d0aae-8f7b-444f-aeab-b5deb753fd31.png">

- Có thể thấy file có lỗi buffer overflow khi char buf khai báo 28 byte nhưng hàm read lại đọc tới 48 byte.
- Để lấy được hàm shell từ win ta phải overwrite saverip của main.

Nhưng, dữ liệu của hàm win là nhứng cái byte không print và nhập = bàn phím được:

<img width="232" alt="Screenshot_20230224_110914" src="https://user-images.githubusercontent.com/125690279/221228441-0f756e27-38db-4f7d-a7f3-410b72fe4022.png">

Ta phải dùng script Ret2Win:

<img width="454" alt="Screenshot_20230224_073129" src="https://user-images.githubusercontent.com/125690279/221180989-64d43d73-3a31-428d-9a42-fc82bd7feeba.png">

Để overwrite địa chỉ của win vào địa chỉ libc_start_call_main của hàm ret:

<img width="617" alt="Screenshot_20230224_111852" src="https://user-images.githubusercontent.com/125690279/221230872-0ff65f52-999f-4e71-b3b8-835353af4f08.png">

Chạy script ta được shell:

<img width="284" alt="Screenshot_20230224_073106" src="https://user-images.githubusercontent.com/125690279/221231197-d0682fea-d2d8-42c1-90ea-43b75d15dc15.png">

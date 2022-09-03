# Hướng dẫn test API Switch.
1. Tham khảo mô hình demo.
![Demo](https://i.imgur.com/u1dyTki.png)

API sẽ chạy trên máy Management có IP, 10.0.137.188, ssh bằng port 22222, **thông tin SSH chi tiết trên netlab**.
```
ssh root@<IP netlab> -p 22222
```

Đây là ứng dụng cơ bản chỉ bao gồm các lệnh curl để tương tác với API.
Các switch có thể quản lý là:

- NXOS 1 - 9K
- NXOS 1 - Titanium
- NXOS 2 - 9K
- TOP1

Tương ứng với các IP như trên hình, thông tin chi tiết ở trên netlab.

Clone repo về máy:
```
https://github.com/lethehoa/interact_API.git
```

Giao diện khởi chạy:
![GUI](https://i.imgur.com/L146zJU.png)

<hr>

*Lưu ý thêm:* 

API đang chạy ở máy trên screen **api**

Hiện tại chỉ mới test trên 2 con switch là:
- NXOS 1 - 9K
- NXOS 1 - Titanium

Để test thêm cần nhập thông tin vào một file information trên máy Management tại vị trí: **/root/ssh-key/information.txt** với thứ tự nhập sau:

> IP Password Port

Example:

![Example](https://i.imgur.com/QKmv1xV.png)
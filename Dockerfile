FROM python:3.12-slim

# Thiết lập thư mục làm việc
WORKDIR /flask_app

# Sao chép requirements.txt vào container
COPY requirements.txt ./

# Cài đặt python3-venv và tạo môi trường ảo
RUN apt-get update && apt-get install -y python3-venv && \
    python3 -m venv venv

# Cài đặt pip và các gói từ requirements.txt
RUN venv/bin/pip install --upgrade pip && \
    venv/bin/pip install -r requirements.txt

# Sao chép mã nguồn của ứng dụng vào container
COPY . .

# Lệnh chạy ứng dụng
CMD ["venv/bin/python", "flask_docker.py"]


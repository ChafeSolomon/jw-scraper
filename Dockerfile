# Use Alpine Linux
FROM ubuntu:22.04
# Install pip packages
RUN apt update -y && apt install python3 python3-pip -y && apt autoremove -y
RUN pip install requests bs4
# Copy Code in
COPY . .
WORKDIR /src
ENTRYPOINT python3 main.py
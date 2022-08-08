FROM node:18

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install -y --no-install-recommends \
  neofetch \
  ffmpeg \
  wget \
  sudo \
  tesseract-ocr \
  chromium \
  imagemagick

RUN npm install -g pm2
WORKDIR /home/
COPY package.json .
RUN npm install
COPY . .
CMD pm2-runtime start index.js --name bot
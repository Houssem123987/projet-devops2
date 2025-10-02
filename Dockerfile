FROM node:18

WORKDIR /ap

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "src/ap.js"]

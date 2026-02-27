FROM node:18-alpine
WORKDIR /app

COPY . .
RUN npm install
EXPOSE 1980
CMD ["npm", "start"]

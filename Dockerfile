FROM node:latest AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Stage 2
FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app .

EXPOSE 3000

CMD ["npm","start"]


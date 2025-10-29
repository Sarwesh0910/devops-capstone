# Stage 1: Build
FROM node:18 AS builder
WORKDIR /app
COPY app/ .
RUN npm install

# Stage 2: Run
FROM node:18-slim
WORKDIR /app
COPY --from=builder /app .
EXPOSE 3000
CMD ["node", "server.js"]

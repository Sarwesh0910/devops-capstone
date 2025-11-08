# ---------- Stage 1: Build ----------
FROM node:18 AS builder

# Set working directory
WORKDIR /app

# Copy only package.json and install dependencies
COPY app/package.json ./
RUN npm install

# Copy the rest of the application code
COPY app/ ./

# ---------- Stage 2: Runtime ----------
FROM node:18-slim

# Set working directory
WORKDIR /app

# Copy only the built app and dependencies from builder
COPY --from=builder /app /app

# Expose the port your app runs on
EXPOSE 3000

# Start the app
CMD ["npm", "start"]

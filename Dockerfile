# --- Build stage ---
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
# Use npm ci if lockfile exists; otherwise fallback to npm install
RUN [ -f package-lock.json ] && npm ci || npm install
COPY . .
RUN npm run build   # outputs /app/dist

# --- Serve stage ---
FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80

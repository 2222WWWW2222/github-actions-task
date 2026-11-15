FROM node:lts-alpine

WORKDIR /app

# Копіюємо тільки файли залежностей для ефективного кешування
COPY package*.json ./

# Встановлюємо залежності (якщо є production, можна npm ci --only=production)
RUN npm install

# Копіюємо решту файлів проєкту
COPY . .

EXPOSE 3000

CMD ["node", "index.js"]

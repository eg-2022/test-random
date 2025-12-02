# Imagen base
FROM python:3.12.3-slim

# Establecer directorio de trabajo
WORKDIR /app

# Copiar los archivos del proyecto
COPY . /app

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Exponer el puerto donde corre Flask
EXPOSE 5000

# Comando para ejecutar la API
CMD ["python", "app.py"]
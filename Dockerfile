FROM python:3.13.4-alpine3.22

# 2. Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# 3. Copiar o arquivo de dependências
# Copia o requirements.txt para o diretório de trabalho
COPY requirements.txt .

# 4. Instalar as dependências
# Instala as bibliotecas Python listadas no requirements.txt
# Usamos --no-cache-dir para evitar o cache do pip, reduzindo o tamanho da imagem
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# 6. Expor a porta que a aplicação usa
EXPOSE 8000

# Comando para rodar a aplicação usando uvicorn
# O host 0.0.0.0 permite que a aplicação seja acessível externamente ao contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
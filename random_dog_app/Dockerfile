FROM python:3.9
WORKDIR .
COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
ENV FLASK_DEBUG=True
CMD ["python3", "main.py"]
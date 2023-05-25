mkdir certs
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=dogs Inc./CN=dog.com' -keyout certs/dogs.com.key -out certs/dogs.com.crt
openssl req -out certs/dogs.csr -newkey rsa:2048 -nodes -keyout certs/dogs.key -subj "/CN=dogs/O=dog organization"
openssl x509 -req -sha256 -days 365 -CA certs/dogs.com.crt -CAkey certs/dogs.com.key -set_serial 0 -in certs/dogs.csr -out certs/dogs.crt

chmod 666 certs/*

kubectl -n istio-system delete secret dogs-credential

kubectl create -n istio-system secret generic dogs-credential \
  --from-file=tls.key=certs/dogs.key \
  --from-file=tls.crt=certs/dogs.crt \
  --from-file=ca.crt=certs/dogs.com.crt
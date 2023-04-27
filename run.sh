curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.17.2 sh -
cd istio-1.17.2
export PATH=$PWD/bin:$PATH

istioctl manifest apply --set profile=demo -y
cd ../k8s

kubectl label namespace default istio-injection=enabled

kubectl apply -f apps/random_dog

kubectl apply -f apps/nginx

kubectl apply -f ingress

kubectl apply -f egress

minikube tunnel
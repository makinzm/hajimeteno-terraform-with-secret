# Initialize terraform

```bash
terraform init
```
```bash
terraform apply
```

# Check the secret

```bash
kubectl logs secret-pod -n secret-test
```

# Result
```bash
❯ kubectl logs secret-pod -n secret-test

KUBERNETES_SERVICE_PORT=443
KUBERNETES_PORT=tcp://10.43.0.1:443
HOSTNAME=secret-pod
SHLVL=1
HOME=/root
SECRET_PASSWORD=cGFzc3dvcmQ=
CONFIG_PASSWORD=myPassword
KUBERNETES_PORT_443_TCP_ADDR=10.43.0.1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP_PROTO=tcp
SECRET_USERNAME=dXNlcg==
CONFIG_USERNAME=myUser
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_PORT_443_TCP=tcp://10.43.0.1:443
KUBERNETES_SERVICE_HOST=10.43.0.1
PWD=/
```

# Clean up
```bash
terraform destroy
```

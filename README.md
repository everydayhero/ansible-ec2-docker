Ansible Docker image with EC2 support

This image is based on Alpine linux to keep the file size very small. Boto is installed as well as the EC2 dynamic inventory script is also included for your convenience.

To run:

```
docker run --rm -it -e AWS_ACCESS_KEY_ID=... -e AWS_SECRET_ACCESS_KEY=... -v `pwd`:/playbooks everydayhero/ansible /playbooks/example.yml
```

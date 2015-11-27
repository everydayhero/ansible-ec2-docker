FROM alpine:3.2
ENV EC2_INI_PATH=/etc/ansible/ec2.ini
RUN apk add --update python py-pip openssl ca-certificates && \
  apk --update add --virtual build-dependencies python-dev build-base && \
  pip install --upgrade pip                                && \
  pip install boto six ansible                             && \
  apk del build-dependencies && \
  rm -rf /var/cache/apk/*                                  && \
  mkdir -p /etc/ansible
ADD https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py /etc/ansible/hosts
ADD https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini /etc/ansible/ec2.ini
RUN chmod +x /etc/ansible/hosts
ENTRYPOINT ["ansible-playbook"]
CMD ["--help"]

+++
title = "Chrome"
date = "2021-05-28"
tags = ["ssl"]
+++

Chrome 58 onwards doesn't permit self signed SSL certificates which rely on the
'Common Name' - you'll receive a `ERR_CERT_COMMON_NAME_INVALID` error. Going
forward it requires using the 'Subject Alt Name' being set. The following is an
example of how to generate a self signed certificate for `*.website.dev` on a
Mac and add it to the Keychain.

```bash
openssl req \
-newkey rsa:2048 \
-x509 \
-nodes \
-keyout server.key \
-new \
-out server.crt \
-subj /CN=*.website.dev \
-reqexts SAN \
-extensions SAN \
-config <(cat /etc/ssl/openssl.cnf \
  <(printf '[SAN]\nsubjectAltName=DNS:*.website.dev')) \
-sha256 \
-days 3650

sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ./server.crt
```
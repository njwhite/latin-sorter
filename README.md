# Latin Sorter

Latin dictionary webapp powered by Whitaker's Words.

## Instructions

In this repo:

- `pushd ~/certs`
- `openssl req -x509 -newkey rsa:4096 -keyout privkey.pem -out fullchain.pem -days 365 -subj '/CN=localhost' -nodes`
- `popd`
- `docker build -t derigenda .`
- `docker run --privileged=true -p 8080:443 -v ~/certs:/etc/letsencrypt/live/derigenda.co.uk derigenda`
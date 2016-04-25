# Requirements
- [Vagrant](https://www.vagrantup.com/)

# Setup

```bash
git clone https://github.com/takuan-osho/concourse-sample.git
cd concourse-sample
vagrant up
```

Open [http://192.168.100.4:8080/](http://192.168.100.4:8080/) in your browser and click to download the `fly` CLI appropriate for your operating system.

Move the `fly` binary into your path(`$PATH`), such as `/usr/local/bin` and make it executable.

```bash
sudo mv ~/Downloads/fly /usr/local/bin
sudo chmod +x /usr/local/bin/fly
```

And then login with `fly` CLI.
```bash
fly -t sample login -c http://192.168.100.4:8080
fly -t sample sync
```

Make a `credentials.yml` file in `config` directory. Its contents are as belows:

```yaml
docker-hub-email: ${your email}
docker-hub-username: ${your docker hub account}
docker-hub-password: ${your docker hub password}
docker-hub-openresty-builder: <${your docker hub account}/${any name you like}>

username: ${username}
password: ${password}
target-host: ${target hostname}
target-path: ${rpm package destination}

github-private-key: |-
  -----BEGIN RSA PRIVATE KEY-----
  (your secret key...)
  -----END RSA PRIVATE KEY-----
```

Activate the script for updating pipelines.
```
./update-all-the-pipelines.sh
```

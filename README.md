# Requirements
- [Docker Toolbox](https://www.docker.com/products/docker-toolbox)

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

Activate the script for updating pipelines.
```
./update-all-the-pipelines.sh
```

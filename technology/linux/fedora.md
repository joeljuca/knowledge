# fedora 🐧

## HOW TOs

### Installing Docker on Fedora 28

[The Docker project seems to take some time to release packages for Fedora.](https://github.com/docker/for-linux/issues/295)
Luckily, there's a
[convenience script](https://docs.docker.com/install/linux/docker-ce/fedora/#upgrade-docker-ce-1)
that allows us to install the Docker Community Edition

```
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

If you want to run the `docker` command without having to use `sudo`, add your
user to the `docker` group:

```
sudo usermod -aG docker <your-username>
```

> _Replace `<your-username>` with your Fedora username._

Now, run the following two commands to enable the Docker background service and start
right away:

```
sudo systemctl enable docker
sudo systemctl start docker
```

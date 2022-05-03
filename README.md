# LiveTV
Use Youtube live as IPTV feeds

## Install 

First you need to install Docker, Centos7 users can directly use the following tutorials. [How To Install and Use Docker on CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-centos-7)

After installing Docker, you can enable LiveTV! on your local port 9500 with the following command:

`docker run -d -p9500:9000 zjyl1994/livetv:1.0`

The data file is stored inside the container in the `/root/data` directory, so it is recommended to use the -v command to map this directory to the host's directory.

An example of using an external storage directory is shown below.

docker run -d -p9500:9000 -v /livetvdata:/root/data --name livetv zjyl1994/livetv:1.1

This will open a LiveTV! container on port 9500 that uses the `/mnt/data/livetv` directory as storage.

PS: If you do not specify an external storage directory, LiveTV! will not be able to read the previous configuration file when it reboots.

## Usage

Default password is "password".

First you need to know how to access your host from the outside, if you are using a VPS or a dedicated server, you can visit `http://your_ip:9500` and you should see the following screen.

![index_page](pic/index-en.png)

First of all, you need to click "Auto Fill" in the setting area, set the correct URL, then click "Save Config".

Then you can add a channel. After the channel is added successfully, you can play the M3U8 file from the address column.

When you use Kodi or similar player, you can consider using the M3U file URL in the first row to play, and a playlist containing all the channel information will be generated automatically.

Youtube-dl document here => [https://github.com/ytdl-org/youtube-dl](https://github.com/ytdl-org/youtube-dl)

Document Translate by [DeepL](https://www.deepl.com/zh/translator)


## update youtube-dl

#原作者提供镜像中youtube-dl版本太低，必须要更新才能使用
vi /etc/apk/repositories 
#增加滚动版仓库
http://dl-cdn.alpinelinux.org/alpine/edge/main
http://dl-cdn.alpinelinux.org/alpine/edge/community


通过运行以下命令更新存储库索引并开始从 Alpine Linux 稳定版本升级到滚动发布版本：
$ sudo apk upgrade --update-cache --available
或者，
$ sudo apk upgrade -U -a
升级任务完成后，重启系统：
$ sudo sync
$ sudo reboot


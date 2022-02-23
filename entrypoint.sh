nohup java -jar webdav-aliyundriver-2.4.2.jar --aliyundrive.refresh-token="${TOKEN}" --aliyundrive.auth.enable=false &
mkdir -p /root/.config/rclone
cat << EOF > /root/.config/rclone/rclone.conf
[ali]
type = webdav
url = http://localhost:8080
vendor = other
user = admin
EOF
git clone https://github.com/magicalAttacker/aria2.conf.git
cat << EOF >> /aria2.conf/aria2.conf
rpc-listen-port=${PORT}
## BitTorrent trackers ##
bt-tracker=
EOF
cd aria2.conf
./tracker.sh
cd ..
aria2c --conf-path=/aria2.conf/aria2.conf

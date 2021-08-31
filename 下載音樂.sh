#!/bin/bash
function pause(){
        read -n 1 -p "$*" INP
        if [ $INP != '' ] ; then
                echo -ne '\b \n'
        fi
}
echo 下載影片
if [ $1 != '' ]; then
	echo 從檔案讀取：$1
	while read line ; do
		echo "url:${line}"
		youtube-dl -x --audio-format mp3 ${line} --external-downloader aria2c --external-downloader-args "-x 16 -k 1M"
	done < $1
	echo 下載完成
	pause '按任意鍵退出'
else
	read -p "網址？" url
	youtube-dl -x --audio-format mp3 ${url} --external-downloader aria2c --external-downloader-args "-x 16 -k 1M"
	echo 下載完成
	pause '按任意鍵退出'
fi

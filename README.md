# gupiao_courses
    股票才女付费课程-女王交易系统课

## 将视频文件保存到本地,可直接下载 download_video.sh 执行

    生成转存脚本
``` javascript
//先将json 处理一下 (无排序)
list=[];
document.body.innerText="";
$.getJSON("list.json",function(data){
    data[1].courses.forEach(v=>{list.push("ffmpeg  -i \""+v.play_url+"\" -f mp3 -vn \""+v.title+".mp3\"")});
    data[0].courses.filter((item,idx)=>{return idx>=27}).forEach(v=>{list.push("ffmpeg  -i \""+v.play_url+"\" -f mp3 -vn \""+v.title+".mp3\"")});
    document.write(list.join("<br/>"))
})

//增加文件排序，方便顺序播放
list=[];
document.body.innerText="";
$.getJSON("list.json",function(data){
    data[1].courses.forEach(v=>{fileNo=list.length+1;if(fileNo<10){fileNo="00"+fileNo}else if(fileNo<100){fileNo="0"+fileNo};list.push("ffmpeg  -i \""+v.play_url+"\" -f mp3 -vn \""+fileNo+"-"+v.title+".mp3\"")});
    data[0].courses.filter((item,idx)=>{return idx>=27}).forEach(v=>{fileNo=list.length+1;if(fileNo<10){fileNo="00"+fileNo}else if(fileNo<100){fileNo="0"+fileNo};list.push("ffmpeg  -i \""+v.play_url+"\" -f mp3 -vn \""+fileNo+"-"+v.title+".mp3\"")});
    document.write(list.join("<br/>"))
})

```
    将文件存在到文件，比如 download_video.sh
``` shell
ffmpeg -i "http://1252524126.vod2.myqcloud.com/9764a7a5vodtransgzp1252524126/99c0c2025285890796247577648/drm/v.f230.m3u8" -vcodec copy -acodec copy -absf aac_adtstoasc "001-【基础课程】第一章之什么是人气龙头.mp4"
ffmpeg -i "http://1252524126.vod2.myqcloud.com/9764a7a5vodtransgzp1252524126/e9112a595285890796248679104/drm/v.f230.m3u8" -vcodec copy -acodec copy -absf aac_adtstoasc "002-【基础课程】第二章上之人气龙头的生命周期.mp4"
ffmpeg -i "http://1252524126.vod2.myqcloud.com/9764a7a5vodtransgzp1252524126/e8d7a4605285890796248643489/drm/v.f230.m3u8" -vcodec copy -acodec copy -absf aac_adtstoasc "003-【基础课程】第二章下之人气龙头和板块之间的关系.mp4"
ffmpeg -i "http://1252524126.vod2.myqcloud.com/9764a7a5vodtransgzp1252524126/e6ce23655285890796248589359/drm/v.f230.m3u8" -vcodec copy -acodec copy -absf aac_adtstoasc "004-【基础课程】第三章Ⅰ之人气龙头起步.mp4"
ffmpeg -i "http://1252524126.vod2.myqcloud.com/9764a7a5vodtransgzp1252524126/e6cc8f005285890796248586735/drm/v.f230.m3u8" -vcodec copy -acodec copy -absf aac_adtstoasc "005-【基础课程】第三章Ⅱ之人气龙头的分歧.mp4"
ffmpeg -i "http://1252524126.vod2.myqcloud.com/9764a7a5vodtransgzp1252524126/e4862c5c5285890796248490557/drm/v.f230.m3u8" -vcodec copy -acodec copy -absf aac_adtstoasc "006-【基础课程】第三章Ⅲ之人气龙头中继.mp4"
ffmpeg -i "http://1252524126.vod2.myqcloud.com/9764a7a5vodtransgzp1252524126/e463a9195285890796248473760/drm/v.f230.m3u8" -vcodec copy -acodec copy -absf aac_adtstoasc "007-【基础课程】第三章Ⅳ之人气龙头反包.mp4"

```

## 执行转存脚本 
    大概需要好几个小时，因为视频比较多，请等待，期间保证网络不要断，可能导出视频无法播放

## 提取音频文件方便听 mp3.sh
``` shell
tmpFile=/tmp/mp4.tmp.$$0
tmpResult=/tmp/mp3.tmp.$$0
while [ -f "${tmpResult}" ] 
do 
    tmpResult=${tmpResult}.$$0
done
echo "cd `pwd`" >> ${tmpResult}
ls *.mp4 > $tmpFile
while read line 
do 
mp3File=${line%%.mp4}.mp3
echo ffmpeg -i \"$line\" -f mp3 -vn \"${mp3File}\" >> ${tmpResult}
# ffmpeg -i "$line" -f mp3 -vn "${mp3FileName}"
done < $tmpFile
sh ${tmpResult}
rm -f $tmpFile
rm -f ${tmpResult}
```

## 添加播放列表，好好学习，早日赚大钱

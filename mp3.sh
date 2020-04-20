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
#!/bin/bash
#Description: Create XFCE Terminal colorschemes from Xresources/Xdefaults files
#Place resulting .theme files in /usr/share/xfce4/terminal/colorschemes/
#Copyright: Rxtx Project <nodiscc@gmail.com>
#Thanks to u/evaryont at http://redd.it/15z69z
#License: MIT (http://opensource.org/licenses/MIT)
#TODO: does not work for any xdefaults file (see space_supreme.xdefaults)

XRESFILE="$1"
TEMPFILE=""
ARRAY=""

# grep -q "define" "$XRESFILE"
# if [ "$?" = 0 ] #cpp-style file detected
# then
TEMPFILE=`mktemp`
cpp < "$XRESFILE" > "$TEMPFILE"
XRESFILE="$TEMPFILE"
# fi

number=0
while [ $number -lt 16 ]
do
    ARRAY=`echo $ARRAY ; egrep "URxvt.color$number[\: ]|\*color$number[\: ]" $XRESFILE | egrep -v "^\!"| awk '{print $NF}'`
    # ARRAY=`echo $ARRAY ; echo B` 相当于x =+ x 自加
    # -awk'{print $ NF}'表示打印空格分隔文件中的最后一个字段。
    number=$(($number+1))
    # echo $ARRAY
done

PALETTEVALUE=`echo $ARRAY | sed 's/\ /\;/g'`
# 将空格替换为;冒号.
# echo $PALETTEVALUE

# X_BACKGROUNDVALUE=`grep background $XRESFILE | awk '{print $NF}'`
X_BACKGROUNDVALUE=`grep background $XRESFILE  | egrep -v "^\!" | awk '{print $NF}'`
# X_FOREGROUNDVALUE=`grep foreground $XRESFILE | awk '{print $NF}'`
X_FOREGROUNDVALUE=`grep foreground $XRESFILE  | egrep -v "^\!" | awk '{print $NF}'`

BACKGROUNDVALUE_PART1=${X_BACKGROUNDVALUE:1:2}
# ${X_BACKGROUNDVALUE:1:2}从第1个字符开始截取2个字符.
BACKGROUNDVALUE_PART2=${X_BACKGROUNDVALUE:3:2}
BACKGROUNDVALUE_PART3=${X_BACKGROUNDVALUE:5:2}
BACKGROUNDVALUE="#$BACKGROUNDVALUE_PART1$BACKGROUNDVALUE_PART2$BACKGROUNDVALUE_PART3"

FOREGROUNDVALUE_PART1=${X_FOREGROUNDVALUE:1:2}
FOREGROUNDVALUE_PART2=${X_FOREGROUNDVALUE:3:2}
FOREGROUNDVALUE_PART3=${X_FOREGROUNDVALUE:5:2}
FOREGROUNDVALUE="#$FOREGROUNDVALUE_PART1$FOREGROUNDVALUE_PART2$FOREGROUNDVALUE_PART3"


THEMENAME=`basename $1 | awk -F "\." '{print $1}' 2>/dev/null`
# '{print $1}'中的$1代表前面管道的输出.

CONTENTS=`
echo "[Scheme]"
echo "Name=${THEMENAME}"
echo "ColorPalette=$PALETTEVALUE"
echo "ColorForeground=$FOREGROUNDVALUE"
echo "ColorCursor=$FOREGROUNDVALUE"
echo "ColorBackground=$BACKGROUNDVALUE"`

:<<EOF
CONTENTS="
[Scheme]
Name=${THEMENAME}
ColorPalette=$PALETTEVALUE
ColorForeground=$FOREGROUNDVALUE
ColorCursor=$FOREGROUNDVALUE
ColorBackground=$BACKGROUNDVALUE"
echo ${CONTENTS}
EOF

echo "Writing ${THEMENAME}.theme file..."
echo "${CONTENTS}" > "${THEMENAME}".theme

if [ -f "$TEMPFILE" ]
then rm "$TEMPFILE"
fi

ffmpeg \
	-f v4l2 -thread_queue_size 8192 -i /dev/video0 -c:v h264_omx \
	-b:v 740k -bufsize 740k -vsync 1 -g 16 \
	-filter_complex " \
	drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSansMono-Bold.ttf: \
	x=12:y=12:fontsize=24:fontcolor=black@1:text='%{pts}', \
	drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSansMono-Bold.ttf: \
	x=10:y=10:fontsize=24:fontcolor=white@1:text='%{pts}' \
	" \
	-f flv -rw_timeout 2000000 \
	rtmp://10.0.0.1/live/<VPN接続の認証に用いるユーザー名>

var videoObject = {
				container: '#video', //容器的ID或className
				variable: 'player',
				volume: 0.6, //默认音量
				poster: 'static/screenshot/wdm.jpg', //封面图片地址
				autoplay: false, //是否自动播放
				loop: true, //是否循环播放
				live: false, //是否是直播
				loaded: 'loadedHandler', //当播放器加载后执行的函数
				seek: 0, //默认需要跳转的时间
				drag: '', //在flashplayer情况下是否需要支持拖动，拖动的属性是什么
				front: 'frontFun', //前一集按钮动作
				next: 'nextFun', //下一集按钮动作
				//flashplayer: true, //强制使用flashplayer
				//html5m3u8:true,//是否使用hls，默认不选择，如果此属性设置成true，则不能设置flashplayer:true,
				chtrack: {
					src: 'static/screenshot/srt.srt',
					charset: 'utf-8'
				}, //字幕文件及编码
				preview: {
					src: ['static/screenshot/mydream_en1800_1010_01.jpg', 
					      'static/screenshot/mydream_en1800_1010_02.jpg'],
					scale: 2
				}, //预览图片地址数组，src=图片地址数组，scale=图片截取时间间隔，单位：秒
				prompt: [{
						words: '小女孩跟外公学习弹钢琴',
						time: 16,
					},
					{
						words: '女主离开家乡',
						time: 60,
					},
					{
						words: '女主奋斗',
						time: 120,
					},
					{
						words: '哈哈哈',
						time: 180,
					}
				], //提示点，words=提示点的内容，time=提示点对应的时间
				video: [
					['http://vjs.zencdn.net/v/oceans.mp4', 'video/mp4', '中文测试', 0],
					['http://img.ksbbs.com/asset/Mon_1703/05cacb4e02f9d9e.mp4', 'video/mp4', '中文标清', 0],
					['http://img.ksbbs.com/asset/Mon_1703/d0897b4e9ddd9a5.mp4', 'video/mp4', '中文高清', 10],
					['http://img.ksbbs.com/asset/Mon_1703/eb048d7839442d0.mp4', 'video/mp4', '英文高清', 0],
					['http://img.ksbbs.com/asset/Mon_1703/d30e02a5626c066.mp4', 'video/mp4', '英文超清', 0],
				]
				/*video:[
					['http://cdn.theoplayer.com/video/star_wars_episode_vii-the_force_awakens_official_comic-con_2015_reel_(2015)/index.m3u8','','标清',0],
					['http://cdn.theoplayer.com/video/star_wars_episode_vii-the_force_awakens_official_comic-con_2015_reel_(2015)/index.m3u8','','高清',10]
				]*/
			};
			var player=new chplayer(videoObject);
			
			function loadedHandler() {
				changeText('.playerstate', '状态：播放器已加载，建立监听：监听元数据，监听其它状态');
				player.addListener('error', errorHandler); //监听视频加载出错
				player.addListener('loadedmetadata', loadedMetaDataHandler); //监听元数据
				player.addListener('play', playHandler); //监听暂停播放
				player.addListener('pause', pauseHandler); //监听暂停播放
				player.addListener('timeupdate', timeUpdateHandler); //监听播放时间
				player.addListener('seeking', seekingHandler); //监听跳转播放
				player.addListener('seeked', seekedHandler); //监听跳转播放完成
				player.addListener('volumechange', volumeChangeHandler); //监听音量改变
				player.addListener('full', fullHandler); //监听全屏/非全屏切换
				player.addListener('ended', endedHandler); //监听全屏/非全屏切换
				player.addListener('videochange', videoChangeHandler); //监听视频地址改变
			}

			function errorHandler() {
				changeText('.playerstate', '状态：视频加载错误，停止执行其它动作，等待其它操作');
			}
			
			function loadedMetaDataHandler() {
				var metaData = player.getMetaDate();
				var html = ''
				if(parseInt(metaData['videoWidth']) > 0) {
					changeText('.playerstate', '状态：获取到元数据信息，如果数据错误，可以使用延迟获取');
					html += '总时间：' + metaData['duration'] + '秒，';
					html += '音量：' + metaData['volume'] + '（范围0-1），';
					html += '播放器的宽度：' + metaData['width'] + 'px，';
					html += '播放器的高度：' + metaData['height'] + 'px，';
					html += '视频的实际宽度：' + metaData['videoWidth'] + 'px，';
					html += '视频的实际高度：' + metaData['videoHeight'] + 'px，';
					html += '是否暂停状态：' + metaData['paused'];
				} else {
					changeText('.playerstate', '状态：未正确获取到元数据信息');
					html = '您正在使用移动端或iPad观看本页面，该平台限制了视频加载，只有在点击了播放器后才能加载视频及获取元数据信息';
				}
				changeText('.metadata', html);
			}
			
			function playHandler() {
				//player.animateResume();//继续播放所有弹幕
				changeText('.playstate', '播放状态：播放');
				window.setTimeout(function() {
					loadedMetaDataHandler();
				}, 1000);
				loadedMetaDataHandler();
			}

			function pauseHandler() {
				//player.animatePause();//暂停所有弹幕
				changeText('.playstate', '播放状态：暂停');
				loadedMetaDataHandler();
			}
			
			function timeUpdateHandler() {
				changeText('.currenttimestate', '当前播放时间（秒）：' + player.time);
			}

			function seekingHandler() {
				changeText('.seekstate', '跳转动作：正在进行跳转');
			}

			function seekedHandler() {
				changeText('.seekstate', '跳转动作：跳转完成');
			}

			function volumeChangeHandler() {
				changeText('.volumechangestate', '当前音量：' + player.volume);
			}
			
			function fullHandler() {
				var html = player.getByElement('.fullstate').innerHTML;
				if(player.full) {
					html += '，全屏';
				} else {
					html += '，否';
				}
				changeText('.fullstate', html);
			}

			function endedHandler() {
				changeText('.endedstate', '播放结束');
			}
			var videoChangeNum = 0;

			function videoChangeHandler() {
				videoChangeNum++;
				changeText('.videochangestate', '视频地址改变了' + videoChangeNum + '次');
			}
			
			//----------------------------------------------
		
			function seekTime() {
				var time = parseInt(player.getByElement('.seektime').value);
				var metaData = player.getMetaDate();
				var duration = metaData['duration'];
				if(time < 0) {
					alert('请填写大于0的数字');
					return;
				}
				if(time > duration) {
					alert('请填写小于' + duration + '的数字');
					return;
				}
				player.seek(time);
			}

			function changeVolume() {
				var volume = player.getByElement('.changevolume').value;
				volume = Math.floor(volume * 100) / 100
				if(volume < 0) {
					alert('请填写大于0的数字');
					return;
				}
				if(volume > 1) {
					alert('请填写小于1的数字');
					return;
				}
				player.changeVolume(volume);
			}
		
			//----------------------------------------------
			
			function changeSize() {
				player.changeSize(w, h)
			}

			function frontFun() {
				alert('点击了前一集');
			}

			function nextFun() {
				alert('点击了下一集');
			}
			
			function newVideo() {
				var videoUrl = player.getByElement('.videourl').value;
				changeVideo(videoUrl);
			}

			function newVideo2() {
				var videoUrl = player.getByElement('.videourl2').value;
				changeVideo(videoUrl);
			}
			
			function changeVideo(videoUrl) {
				if(player == null) {
					return;
				}

				var newVideoObject = {
					container: 'video', //容器的ID
					variable: 'player',
					autoplay: true, //是否自动播放
					loaded: 'loadedHandler', //当播放器加载后执行的函数
					video: videoUrl
				}
				//判断是需要重新加载播放器还是直接换新地址

				if(player.playerType == 'html5video') {
					if(player.getFileExt(videoUrl) == '.flv' || player.getFileExt(videoUrl) == '.m3u8' || player.getFileExt(videoUrl) == '.f4v' || videoUrl.substr(0, 4) == 'rtmp') {
						player.removeChild();

						player = null;
						player = new chplayer();
						player.embed(newVideoObject);
					} else {
						player.newVideo(newVideoObject);
					}
				} else {
					if(player.getFileExt(videoUrl) == '.mp4' || player.getFileExt(videoUrl) == '.webm' || player.getFileExt(videoUrl) == '.ogg') {
						player = null;
						player = new chplayer();
						player.embed(newVideoObject);
					} else {
						player.newVideo(newVideoObject);
					}
				}
			}
			
			function newElement() {
				var attribute = {
					list: [{
							type: 'image',
							url: 'static/screenshot/logo.png',
							radius: 30, //圆角弧度
							width: 30, //定义宽，必需要定义
							height: 30, //定义高，必需要定义
							alpha: 0.9, //透明度
							marginLeft: 10,
							marginRight: 10,
							marginTop: 10,
							marginBottom: 10
						},
						{
							type: 'text', //说明是文本
							text: '这里是一个普通的元件，不支持HTML', //文本内容
							fontColor: '#FFFFFF',
							fontSize: 14,
							fontFamily: '"Microsoft YaHei", YaHei, "微软雅黑", SimHei,"\5FAE\8F6F\96C5\9ED1", "黑体",Arial',
							lineHeight: 30,
							alpha: 1, //透明度
							//paddingLeft:10,//左边距离
							paddingRight: 10, //右边距离
							paddingTop: 0,
							paddingBottom: 0,
							marginLeft: 0,
							marginRight: 0,
							marginTop: 10,
							marginBottom: 0,
							//backgroundColor:'#000000',
							backAlpha: 0.5,
							backRadius: 30 //背景圆角弧度
						}
					],
					x: 10, //x轴坐标
					y: 10, //y轴坐标
					//position:[1,1],//位置[x轴对齐方式（0=左，1=中，2=右），y轴对齐方式（0=上，1=中，2=下），x轴偏移量（不填写或null则自动判断，第一个值为0=紧贴左边，1=中间对齐，2=贴合右边），y轴偏移量（不填写或null则自动判断，0=紧贴上方，1=中间对齐，2=紧贴下方）]
					alpha: 1,
					backgroundColor: '#000000',
					backAlpha: 0.5,
					backRadius: 60 //背景圆角弧度
				}
				var el = player.addElement(attribute);
			}
			
			
			function newDanmu() {
				//弹幕说明

				var danmuObj = {
					list: [{
							type: 'image',
							url: 'static/screenshot/logo.png',
							radius: 30, //圆角弧度
							width: 30, //定义宽，必需要定义
							height: 30, //定义高，必需要定义
							alpha: 0.9, //透明度
							marginLeft: 10,
							marginRight: 10,
							marginTop: 0,
							marginBottom: 0
						},
						{
							type: 'text', //说明是文本
							text: '演示弹幕内容，弹幕只支持普通文本，不支持HTML', //文本内容
							fontColor: '#FFFFFF',
							fontSize: 14,
							fontFamily: '"Microsoft YaHei", YaHei, "微软雅黑", SimHei,"\5FAE\8F6F\96C5\9ED1", "黑体",Arial',
							lineHeight: 30,
							alpha: 1, //透明度
							paddingLeft: 10, //左边距离
							paddingRight: 10, //右边距离
							paddingTop: 0,
							paddingBottom: 0,
							marginLeft: 0,
							marginRight: 0,
							marginTop: 0,
							marginBottom: 0,
							backgroundColor: '#000000',
							backAlpha: 0.5,
							backRadius: 30 //背景圆角弧度
						}
					],
					x: '100%', //x轴坐标
					y: "50%", //y轴坐标
					//position:[2,1,0],//位置[x轴对齐方式（0=左，1=中，2=右），y轴对齐方式（0=上，1=中，2=下），x轴偏移量（不填写或null则自动判断，第一个值为0=紧贴左边，1=中间对齐，2=贴合右边），y轴偏移量（不填写或null则自动判断，0=紧贴上方，1=中间对齐，2=紧贴下方）]
					alpha: 1,
					//backgroundColor:'#FFFFFF',
					backAlpha: 0.8,
					backRadius: 30 //背景圆角弧度
				}
				var danmu = player.addElement(danmuObj);
				var danmuS = player.getElement(danmu);
				var obj = {
					element: danmu,
					parameter: 'x',
					static: true, //是否禁止其它属性，true=是，即当x(y)(alpha)变化时，y(x)(x,y)在播放器尺寸变化时不允许变化
					effect: 'None.easeOut',
					start: null,
					end: -danmuS['width'],
					speed: 10,
					overStop: true,
					pauseStop: true,
					callBack: 'deleteChild'
				};
				var danmuAnimate = player.animate(obj);
			}
			
			function deleteChild(ele) {
				if(player) {
					player.deleteElement(ele);
				}
			}
			function changeText(div, text) {
				player.getByElement(div).innerHTML = text;
			}
		
		
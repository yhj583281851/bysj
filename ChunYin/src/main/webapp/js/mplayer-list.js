/**
 * 播放列表
 * @type {Array}
 * 请用数组来定义总列表
 * 再用二维数组定义每个列表
 * 其中列表里的每首歌需用对象定义
 * 请在每个列表中的第一个元素定义列表信息（必须位于第一位）
 * 列表信息必须有一个basic属性，值为true
 * 还要有一个name属性，值为列表名称
 * 可选参数为singer、image，用于为定义的该属性的歌曲调用
 * 每首歌必须有name、src、lrc三个属性
 * src为歌曲相对于index.html的相对路径或绝对路径
 * 可选singer和image属性
 * 在每首歌没有定义singer或image时将使用列表的singer或image
 * 请确保一定有一个被定义
 * 其中name为歌曲名称
 * src为歌曲文件路径
 * lrc为歌词，请用\n或\r将每行歌词隔开，否则无法识别
 */

var mplayer_song = [[
	{
		"basic":true,
		"name":"播放列表",
//		"singer":"许嵩",
//		"img":"https://y.gtimg.cn/music/photo_new/T001R300x300M000000CK5xN3yZDJt.jpg"
	},
	{
		"name":"醇音",
		"singer":"作曲人",
		"img":"",
		"src":"http://pandgut.edu.cn/openapi/stream/preview?access_token=7b37139d-a246-47b6-99d9-13aa40c35949&checkPermission=true&support=wopi&fileId=6b48f5c9-4593-4b2d-abf1-31106da8994e&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=",
	}
]]

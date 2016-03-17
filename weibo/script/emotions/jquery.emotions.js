// jQuery Plugins: On/Off Emtions 
var __emotion__cache = false;
jQuery.fn.emotions = function() {
	var aEmotion = new Array();
	aEmotion[19] = new Array('&gt;:)','&gt;\\:\\)');
	aEmotion[21] = new Array(':))','\\:\\)\\)');
	aEmotion[23] = new Array('/:)','/\\:\\)');
	aEmotion[48] = new Array('&lt;):)','&lt;\\)\\:\\)');
	aEmotion[100] = new Array(':)]','\\:\\)\\]');
	aEmotion[1] = new Array(':)','\\:\\)');
	aEmotion[20] = new Array(':((','\\:\\(\\(');
	aEmotion[2] = new Array(':(','\\:\\(');
	aEmotion[5] = new Array(';;)',';;\\)');
	aEmotion[3] = new Array(';)',';\\)');
	aEmotion[6] = new Array('&gt;:D&lt;','&gt;\\:D&lt;');
	aEmotion[4] = new Array(':D','\\:D');
	aEmotion[42] = new Array(':-SS','\\:-SS');
	aEmotion[18] = new Array('#:-S','#\\:-S');
	aEmotion[39] = new Array(':-?','\\:-\\?');
	aEmotion[47] = new Array('&gt;:P','&gt;\\:P');
	aEmotion[10] = new Array(':P','\\:P');
	aEmotion[37] = new Array('(:|','\\(\\:\\|');
	aEmotion[22] = new Array(':|','\\:\\|');
	aEmotion[7] = new Array(':-/','\\:-/');
	aEmotion[11] = new Array(':-*','\\:-\\*');
	aEmotion[12] = new Array('=((','\\=\\(\\(');
	aEmotion[102] = new Array('~X(','~X\\(');
	aEmotion[16] = new Array('B-)','B-\\)');
	aEmotion[17] = new Array(':-S','\\:-S');
	aEmotion[24] = new Array('=))','\\=\\)\\)');
	aEmotion[25] = new Array('O:-)','O\\:-\\)');
	aEmotion[26] = new Array(':-B','\\:-B');
	aEmotion[27] = new Array('=;','\\=;');
	aEmotion[29] = new Array('8-|','8-\\|');
	aEmotion[30] = new Array('L-)','L-\\)');
	aEmotion[31] = new Array(':-&amp;','\\:-&amp;');
	aEmotion[32] = new Array(':-$','\\:-\\$');
	aEmotion[33] = new Array('[-(','\\[-\\(');
	aEmotion[34] = new Array(':O)','\\:O\\)');
	aEmotion[35] = new Array('8-}','8-\\}');
	aEmotion[36] = new Array('&lt;:-P','&lt;\\:-P');
	aEmotion[8] = new Array(':x','\\:x');
	aEmotion[38] = new Array('=P~','\\=P~');
	aEmotion[40] = new Array('#-o','#-o');
	aEmotion[41] = new Array('=D&gt;','\\=D&gt;');
	aEmotion[43] = new Array('@-)','@-\\)');
	aEmotion[44] = new Array(':^o','\\:\\^o');
	aEmotion[45] = new Array(':-w','\\:-w');
	aEmotion[46] = new Array(':-&lt;','\\:-&lt;');
	aEmotion[13] = new Array(':-O','\\:-O');
	aEmotion[15] = new Array(':&gt;','\\:&gt;');
	aEmotion[101] = new Array(':-c','\\:-c');
	aEmotion[14] = new Array('X(','X\\(');
	aEmotion[103] = new Array(':-h','\\:-h');
	aEmotion[105] = new Array('8-&gt;','8-&gt;');
	__emotion__cache = true;
	this.each(function() {
		str = $(this).html();
		for(iEM in aEmotion){
			reg =  new RegExp(aEmotion[iEM][1],"ig");
			str = str.replace(reg,'<span class="plugin_emotion" title="'+encodeURIComponent(aEmotion[iEM][0])+'"><img  src="themes/default/emotions/'+iEM+'.gif" /></span>');
		}
		$(this).html(str);
	});
};
jQuery.fn.unemotions = function(){
	__emotion__cache = false;
	$('.plugin_emotion').each(function(){
		$(this).html(decodeURIComponent(this.title));								   
	});
}

var bui = {};

bui.g = function (id, parentNode) {
    if (!parentNode || parentNode == bui.bocument || parentNode == bui.bocument.body) {
        return bui.dom ? bui.dom.getElementById(id) : document.getElementById(id);
    }
    else {
        var i, len, k, v,
            childNode,
            elements,
            list,
            childlist,
            node;
        elements=[],list=[parentNode];
        
        while(list.length){
            childNode= list.pop();
            if(!childNode) continue;
            if (childNode.id == id) {
                break;
            }
            elements.push(childNode);
            childlist = childNode.childNodes;
            if(!childlist||childlist.length<1) continue;
            for(i=0,len=childlist.length;i<len;i++){
                node = childlist[i];
                list.push(node);
            }
        }
        return (childNode.id == id ? childNode : null);
    }
};

bui.formatDate = function(date,fmt) {      
    if(!date) date = new Date(); 
    fmt = fmt||'yyyy-MM-dd HH:mm'; 
    var o = {      
    "M+" : date.getMonth()+1, //月份      
    "d+" : date.getDate(), //日      
    "h+" : date.getHours()%12 == 0 ? 12 : date.getHours()%12, //小时      
    "H+" : date.getHours(), //小时      
    "m+" : date.getMinutes(), //分      
    "s+" : date.getSeconds(), //秒      
    "q+" : Math.floor((date.getMonth()+3)/3), //季度      
    "S" : date.getMilliseconds() //毫秒      
    };      
    var week = {      
    "0" : "/u65e5",      
    "1" : "/u4e00",      
    "2" : "/u4e8c",      
    "3" : "/u4e09",      
    "4" : "/u56db",      
    "5" : "/u4e94",      
    "6" : "/u516d"     
    };      
    if(/(y+)/.test(fmt)){      
        fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));      
    }      
    if(/(E+)/.test(fmt)){      
        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[date.getDay()+""]);      
    }      
    for(var k in o){      
        if(new RegExp("("+ k +")").test(fmt)){      
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));      
        }      
    }      
    return fmt;      
};  
/*  
  将String类型解析为Date类型.  
  parseDate('2006-1-1') return new Date(2006,0,1)  
  parseDate(' 2006-1-1 ') return new Date(2006,0,1)  
  parseDate('2006-1-1 15:14:16') return new Date(2006,0,1,15,14,16)  
  parseDate(' 2006-1-1 15:14:16 ') return new Date(2006,0,1,15,14,16);  
  parseDate('不正确的格式') retrun null  
*/   
bui.parseDate = function(str){   
    str = String(str).replace(/^[\s\xa0]+|[\s\xa0]+$/ig, ''); 
    var results = null; 
     
    //秒数 #9744242680 
    results = str.match(/^ *(\d{10}) *$/);   
    if(results && results.length>0)   
      return new Date(parseInt(str)*1000);    
     
    //毫秒数 #9744242682765 
    results = str.match(/^ *(\d{13}) *$/);   
    if(results && results.length>0)   
      return new Date(parseInt(str));    
     
    //20110608 
    results = str.match(/^ *(\d{4})(\d{2})(\d{2}) *$/);   
    if(results && results.length>3)   
      return new Date(parseInt(results[1]),parseInt(results[2]) -1,parseInt(results[3]));    
     
    //20110608 1010 
    results = str.match(/^ *(\d{4})(\d{2})(\d{2}) +(\d{2})(\d{2}) *$/);   
    if(results && results.length>6)   
      return new Date(parseInt(results[1]),parseInt(results[2]) -1,parseInt(results[3]),parseInt(results[4]),parseInt(results[5]));    
     
    //2011-06-08 
    results = str.match(/^ *(\d{4})[\._\-\/\\](\d{1,2})[\._\-\/\\](\d{1,2}) *$/);   
    if(results && results.length>3)   
      return new Date(parseInt(results[1]),parseInt(results[2]) -1,parseInt(results[3]));    
     
    //2011-06-08 10:10 
    results = str.match(/^ *(\d{4})[\._\-\/\\](\d{1,2})[\._\-\/\\](\d{1,2}) +(\d{1,2}):(\d{1,2}) *$/);   
    if(results && results.length>6)   
      return new Date(parseInt(results[1]),parseInt(results[2]) -1,parseInt(results[3]),parseInt(results[4]),parseInt(results[5]));    
     
    //2011-06-08 10:10:10 
    results = str.match(/^ *(\d{4})[\._\-\/\\](\d{1,2})[\._\-\/\\](\d{1,2}) +(\d{1,2}):(\d{1,2}):(\d{1,2}) *$/);   
    if(results && results.length>6)   
      return new Date(parseInt(results[1]),parseInt(results[2]) -1,parseInt(results[3]),parseInt(results[4]),parseInt(results[5]),parseInt(results[6]));    
     
    return null;   
}; 

// 3 -> 003
bui.toFixed = function (num, unit) {
    if (unit == '00') {
        if (num < 10) {
            num = '0' + num;
        }
    }
    else if (unit == '000') {
        if (num < 10) {
            num = '00' + num;
        }
        else if (num < 100) {
            num = '0' + num;
        }
    }
    return num;
}


var autoTimer = {
	list: [],
	start: function  (){
		autoTimer.timer = window.setTimeout('autoTimer.doing()', 10);
	},
	doing: function(){
		var me = autoTimer,
            item,
            dd,
            now = new Date(),
            time = now.getTime(),
            day, h, m, s, ms;
		for (var i=0,len=me.list.length; i<len; i++) {
            item = me.list[i];
            dd = item.end - time;
            dd = dd < 0 ? 0 : dd;
            day = Math.floor(dd/me.left_day);
            h = Math.floor((dd - day * me.left_day)/me.left_h);
            m = Math.floor((dd - day * me.left_day - h * me.left_h)/me.left_m);
            s = Math.floor((dd - day * me.left_day - h * me.left_h - m * me.left_m)/me.left_s);
            ms= Math.floor((dd - day * me.left_day - h * me.left_h - m * me.left_m - s * me.left_s)/me.left_ms);
            
            bui.g(item.id+'_day').innerHTML= bui.toFixed(day, '000');
            bui.g(item.id+'_h').innerHTML  = bui.toFixed(h, '00');
            bui.g(item.id+'_m').innerHTML  = bui.toFixed(m, '00');
            bui.g(item.id+'_s').innerHTML  = bui.toFixed(s, '00');
            bui.g(item.id+'_ms').innerHTML = bui.toFixed(ms,'00');
        }
        
        me.start();
	},
    init: function () {
        var me = autoTimer;
        for (var i=0,len=me.list.length; i<len; i++) {
            me.list[i].end = bui.parseDate(me.list[i].endTime);
        }
        me.left_ms = 10;
        me.left_s = 1000;
        me.left_m = 60 * me.left_s;
        me.left_h = 60 * me.left_m;
        me.left_day = 24 * me.left_h;
        
    }
};
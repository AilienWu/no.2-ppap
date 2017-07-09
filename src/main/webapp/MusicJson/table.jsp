
<%@page contentType="text/html" pageEncoding="UTF-8" import="org.json.*, com.ppap.util.*"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Co"stntent-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <title>List</title>
    </head>
    
    <body>
   <div id="brand">
  <ul class='bd-box'>
<% 
    JSONObject json = JsonReader.readJsonFromUrl("http://localhost:8100/PPAP/MusicJson/api.jsp");
    JSONArray  songs = json.getJSONArray("musics");
    String titles[] = new String[20];
    String singers[] = new String[20];
    String iterms[] = new String[20];
    for(int i=0;i<songs.length();i++)
{ 
     titles[i] = songs.getJSONObject(i).get("title").toString();
     singers[i] = songs.getJSONObject(i).getJSONObject("attrs").getJSONArray("singer").get(0).toString();
     iterms[i] = titles[i]+"-"+singers[i];
}
    /*String[] str = new String[4];
         str[1] = "新歌榜"+"\n"+iterms[0]+"\n"+iterms[2]+"\n"+iterms[3]+"\n"+iterms[1]+"\n"+iterms[16];
         str[2] = "热歌榜"+"\n"+iterms[4]+"\n"+iterms[5]+"\n"+iterms[6]+"\n"+iterms[7]+"\n"+iterms[17];
         str[3] = "飙升榜"+"\n"+iterms[8]+"\n"+iterms[9]+"\n"+iterms[10]+"\n"+iterms[11]+"\n"+iterms[18];
         str[0] = "精选专栏"+"\n"+iterms[12]+"\n"+iterms[13]+"\n"+iterms[14]+"\n"+iterms[15]+"\n"+iterms[19];*///在以下函数体内更改样式 
/* <div class="list-group">
  <a href="#" class="list-group-item active">
    =iterms[i] 
  </a> 
</div>*/
     %>
 
    <li> <a href="#"></a><img  src="images/1.jpg" /><span > <p><br/><%=iterms[0] %><br/> <br/><%=iterms[1] %><br/> <br/><%=iterms[19] %><br/> <br/><%=iterms[3] %><br/> <br/><%=iterms[4] %><br/> <br/><%=iterms[18] %><br/> <br/><%=iterms[6] %></p> </span></li>
    <li> <a href="#"></a><img src="images/2.jpg" /><span> <p><br/><%=iterms[17] %><br/> <br/><%=iterms[3] %><br/> <br/><%=iterms[14] %><br/> <br/><%=iterms[10] %><br/> <br/><%=iterms[11] %><br/> <br/><%=iterms[12] %><br/> <br/><%=iterms[13] %></p></br> </span></li>
    
  </ul>
   
<script src="js/jquery.js"></script>
<script>
			//display:block;height:75px;top:0px;		显示
			//style="display:none;height:0px;top:38px;" 隐藏
			$(function(){
				var aLi = $('#brand .bd-box li');			
				var aSpan = aLi.find('span');
				var aImg = aLi.find('img');
				aLi.each(function(index){
					$(this).mouseover(function(){
						aImg.eq(index).stop();
						aSpan.eq(index).stop();
						aImg.eq(index).animate({
							height:0,
							top:38
						},80,'',function(){
							$(this).hide();
							aSpan.eq(index).show().animate({
								height:480,
								top:0
							},80)
						})
					})
					$(this).mouseout(function(){
						aImg.eq(index).stop();
						aSpan.eq(index).stop();
						aSpan.eq(index).animate({
							height:0,
							top:38
						},80,'',function(){
							$(this).hide();
							aImg.eq(index).show().animate({
								height:480,
								top:0
							},80)
						})
					})
				})
			})
		</script>
    </body>
</html>

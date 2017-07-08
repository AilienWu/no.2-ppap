
<%@page contentType="text/html" pageEncoding="UTF-8" import="org.json.*, com.ppap.util.*"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>List</title>
    </head>
    <body>
<% 
    JSONObject json = JsonReader.readJsonFromUrl("http://localhost:8084/PPAP/MusicJson/api.jsp");
    JSONArray  songs = json.getJSONArray("musics");
    String titles[] = new String[20];
    String singers[] = new String[20];
    String iterms[] = new String[20];
    for(int i=0;i<songs.length();i++)
{ 
     titles[i] = songs.getJSONObject(i).get("title").toString();
     singers[i] = songs.getJSONObject(i).getJSONObject("attrs").getJSONArray("singer").get(0).toString();
     iterms[i] = titles[i]+"-"+singers[i];
}%>
<%  for(int i=0;i<songs.length();i++)
{       //在以下函数体内更改样式 %>
<div class="list-group">
  <a href="#" class="list-group-item active">
    <%=iterms[i] %>
  </a>

</div>
  <% }  %>
    </body>
</html>

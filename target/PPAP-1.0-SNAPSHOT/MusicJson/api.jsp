<%@ page language="java" contentType="text/json; charset=UTF-8"
	pageEncoding="UTF-8" import="com.ppap.domain.Song,org.json.*, com.ppap.util.*"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%

response.addHeader("Access-Control-Allow-Origin", "*");
// 获取远端的json数据
JSONObject json = JsonReader.readJsonFromUrl("https://api.douban.com/v2/music/search?tag=pop&count=20");

out.println(json.toString());

%>

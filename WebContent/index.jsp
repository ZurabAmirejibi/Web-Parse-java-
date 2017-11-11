<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="com.webscrap4j.WebScrap"%>
<%@page import="com.webscrap4j.WebScrapException"%>
<%@page import="java.io.*"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>IMDB Parse !</h1>
<%
	Document doc = Jsoup.connect("http://www.imdb.com/movies-in-theaters/").get();
	
	// get the page title
	String title = doc.title();
	// Elements titls = doc.select("h4 a");
	for(Element titl : doc.select("#main table") ) {
		
		String str = titl.select(".outline").text();
		String description = str.substring(0,70);
		out.println("<div style='background:#fff;width:480px;'>");
		out.println("<h3 style='color:blue;'>"+ titl.select("h4 a") +"</h3>");
		out.println("<img style='float:left' src="+titl.select("img").attr("src")+"></img>");
		out.println("<div style='font-size: 13px;font-family: dejavu;color: #503636;overflow: hidden;padding: 65px 25px;margin-top: -39px;'><p>"+ titl.select("time[itemprop=duration]") + "</p><p style='color: #7b6259;font-size: 17px;font-weight: 600;'>"+ titl.select("span[itemprop=genre]") + "</p>"+ description);
		out.println("<p style=''><b>Director:</b><span style='color:darkcyan;'> "+ titl.select("span[itemprop=director] a").text() +"</span></p><p><p style=''><b>Stars:</b><span style='color:darkcyan;'> "+ titl.select("span[itemprop=actors] a").text() +"</span></p></div>");
		
		
		
		
		out.println("</div>");
	}

%> 

<h1><%=title%></h1>
</body>
</html>
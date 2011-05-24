<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.http.impl.client.BasicResponseHandler"%>
<%@page import="org.apache.http.client.ResponseHandler"%>
<%@page import="org.apache.http.client.methods.HttpGet"%>
<%@page import="org.apache.http.impl.client.DefaultHttpClient"%>
<%@page import="org.apache.http.client.HttpClient"%>

<%

HttpClient httpclient = new DefaultHttpClient();
       try {
           HttpGet httpget = new
HttpGet("https://api.mercadolibre.com/sites/MLA/search?q=ipod");
           //System.out.println("executing request " + httpget.getURI());

           // Create a response handler
           ResponseHandler<String> responseHandler = new
BasicResponseHandler();
           String responseBody = httpclient.execute(httpget, responseHandler);
           
           //System.out.println(responseBody);
          
   
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%out.println(responseBody);%>
    </body>
</html>
<%} finally {
       // When HttpClient instance is no longer needed,
       // shut down the connection manager to ensure
       // immediate deallocation of all system resources
       httpclient.getConnectionManager().shutdown();
   }
%>
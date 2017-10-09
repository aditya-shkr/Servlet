<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "java.util.ArrayList;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
// retrieve your list from the request, with casting 
ArrayList <Category> list = (ArrayList<Category>) request.getAttribute("list");

// print the information about every category of the list
for(Category category : list) {
    out.println(category.getId());
    out.println(category.getName());
    out.println(category.getMainCategoryId());
}
%>
</body>
</html>
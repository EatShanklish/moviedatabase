
<%@page import="com.Shanklish.Movies.AllMovies"%>
<%@page import="com.Shanklish.Movies.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie List</title>
<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>


<table class="table">

<%
     
        //------------------SQL CONFIG--------------------
        
        Connection con = null;
        Statement st = null;
        int rs = 0;
        
        String url = "jdbc:mysql://localhost:3306/MovieList";
        //DO NOT include this info in .java files pushed to GitHub in real projects
        String user = "java";
        String password = "java123";
        String choice = request.getParameter("Category");
        
        
        //----------------SQL INITIATION-----------------
        
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
   
            String selectQuery = "SELECT * FROM Movies WHERE genre = ?";
       
            PreparedStatement selectStatement = con.prepareStatement(selectQuery);
            
            selectStatement.setString(1, choice);
            
            ResultSet rs2 = selectStatement.executeQuery();

            while (rs2.next()) 
            {
                    int id = rs2.getInt(1);
                    String mTitle = rs2.getString(2);
                    String mGenre = rs2.getString(3);
                    
                    out.println("<tr>"+"<td>"+ id +"</td>"+"<td>" +mTitle+ "</td>"+"<td>"+ mGenre + "</td></tr>");
                    
            }

            
         //-----------------EXECUTABLE JAVA CODE--------
        
            
                    
        } catch (SQLException e) {
            out.println("DB Exception: " + e);
        
        } 
        
        finally {
                try {
                    if (rs > 0) {
                        //rs.close();
                    }
                    if (st != null) {
                        st.close();
                    }
                    if (con != null) {
                        con.close();
                    }
            
            } catch (SQLException e) {
                    out.println("DB Exception in finally: " + e);
            }
        }

%>
</table>

</body>
</html>
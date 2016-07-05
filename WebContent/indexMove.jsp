<%@page import="com.Shanklish.Movies.AllMovies"%>
<%@page import="com.Shanklish.Movies.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie List</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>



</head>

<body>


<table>

<%
     
		//------------------SQL CONFIG--------------------
		
		Connection con = null;
		Statement st = null;
		int rs = 0;
		
		String url = "jdbc:mysql://localhost:3306/MovieList";
		//DO NOT include this info in .java files pushed to GitHub in real projects
		String user = "java";
		String password = "java123";
		
		
		//----------------SQL INITIATION-----------------
		
		try 
		{
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, user, password);
		    st = con.createStatement();
		    
		    String query="INSERT INTO Movies (title, genre) VALUES(?,?)";
		    String selectQuery = "SELECT * FROM Movies";
	
		    PreparedStatement insertStatement = con.prepareStatement(query);
		    PreparedStatement selectStatement = con.prepareStatement(selectQuery);
		    
		    for(int i = 1; i< 101; i++)
			{
			   Movie myMovie = AllMovies.getMovie(i);

			   insertStatement.setString(1, myMovie.getTitle());
		       insertStatement.setString(2, myMovie.getCategory());        
			   rs = insertStatement.executeUpdate();
	 
			}
		    
		    
		    ResultSet rs2 = selectStatement.executeQuery(selectQuery);

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
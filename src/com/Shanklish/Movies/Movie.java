package com.Shanklish.Movies;


public class Movie
{
	private String title;
	private String category;
	
	
	public Movie(String t, String c)
	{	   
	   category = c;
	   title = t;
	}
	
	public Movie()
	{
	    title = null;
	    category = null;
	}

	
	public String getTitle()
	{
	    return title;
	}

	
	
	public String getCategory()
	{
	    return category;
	}
}

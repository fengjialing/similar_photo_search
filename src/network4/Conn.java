package network4;


import java.sql.*;

public class Conn{
	public static Statement stmt;
	public static ResultSet rs;
	public static Connection conn;
	public static String user;
	public static String password;
	public static String url;
 
  public Conn(String user,String password,String database){
	  this.user=user;
	  this.password=password;
	  url="jdbc:mysql://localhost:3306/"+database;
	  try {
		  Class.forName("com.mysql.jdbc.Driver");
	  conn = DriverManager.getConnection(url, user, password);
	  stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	  } catch (ClassNotFoundException e) {
	  e.printStackTrace();
	  } catch (SQLException e) {
	  e.printStackTrace();
	  }
	  } 
  public static ResultSet getRs(String sql){
	  try{
	  rs= stmt.executeQuery(sql);
	  }catch(SQLException e){
	  e.printStackTrace();
	  System.out.println("getrs");
	  }
	  return rs;
	  } 
  public static int updata(String sql){
	  int num=0;
	  try{
	  num = stmt.executeUpdate(sql);
	  }catch(SQLException e){
	  e.printStackTrace();
	  System.out.println("update");
	  }
	  return num;
	  } 
  
  
  public static  void close(){
	  try{
	  if(rs!=null){
	  rs.close();
	  rs = null;
	  }
	  if(stmt!=null){
	  stmt.close();
	  stmt = null;
	  }
	  if(conn!=null){
	  conn.close();
	  conn = null;
	  }
	  }catch(SQLException e){
	  e.printStackTrace();
	  }
	  } 
	  
}


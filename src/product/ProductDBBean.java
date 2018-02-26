package product;

import java.sql.Connection;
import java.sql.DriverManager;

public class ProductDBBean {
	private static ProductDBBean instance=new ProductDBBean();
	private ProductDBBean() {
	}
	public static ProductDBBean getInstance() {
		return instance;
	}
	
	public static Connection getConnection() {
		Connection con=null;
		try {
			String jdbcUrl="jdbc:oracle:thin:@localhost:1521:orcl";
			String dbID="scott";
			String dbPass="tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(jdbcUrl, dbID, dbPass);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}

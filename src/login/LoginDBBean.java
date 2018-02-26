package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


public class LoginDBBean {
	private static LoginDBBean instance=new LoginDBBean();
	private LoginDBBean() {
		
	}
	public static LoginDBBean getInstance() {
		return instance;
	}
	
	public static Connection getConnection() {
		Connection con=null;
		try {
			String jdbcUrl="jdbc:oracle:thin:@localhost:1521:orcl";
			String dbID="scott";
			String dbPass="tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(jdbcUrl,dbID,dbPass);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public int ageCounter(LoginDataBean member) {
		int year=Calendar.getInstance().get(Calendar.YEAR);
		int userInput=Integer.parseInt(member.getBirthday().substring(0, 4));
		return year-userInput;//������(�⵵�θ����)
	}
	public void insertMember(LoginDataBean member) {
		String sql="";
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int number=0;
		//age���

		int age=ageCounter(member);
		
		try {
			pstmt=con.prepareStatement("select memberser.nextval from dual");
			rs=pstmt.executeQuery();
			if(rs.next())
				number=rs.getInt(1)+1;
			else
				number=2;		
			sql="insert into shopmember(num,id,password,name,email,phone,"
					+ "gender,birthday,age,addrnum,address1,address2,reg_date)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
						
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, number);
			pstmt.setString(2, member.getId());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getGender());
			pstmt.setString(8, member.getBirthday());
			pstmt.setInt(9, age);
			pstmt.setString(10, member.getAddrnum());
			pstmt.setString(11, member.getAddress1());
			pstmt.setString(12, member.getAddress2());
			pstmt.executeUpdate();
		
		}catch(SQLException e) {e.printStackTrace();}
		finally {
			close(con,rs,pstmt);
		}
	}
	public int updateMember(LoginDataBean member,String newPw) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int chk=0;
		int age=ageCounter(member);
		String sql;
		
		try {
			conn=getConnection();
			sql="update shopmember set password=?,name=?,email=?,phone=?,gender=?,birthday=?,age=?,addrnum=?,address1=?,address2=? where id=? and password=?";
			pstmt=conn.prepareStatement(sql);

			if(newPw=="n") {
				pstmt.setString(1, member.getPassword());//���� ��й�ȣ ��

			}else {
				pstmt.setString(1, newPw);//������ ��й�ȣ ��
			}
				pstmt.setString(2, member.getName());
				pstmt.setString(3, member.getEmail());
				pstmt.setString(4, member.getPhone());
				pstmt.setString(5, member.getGender());
				pstmt.setString(6, member.getBirthday());
				pstmt.setInt(7, age);
				pstmt.setString(8, member.getAddrnum());
				pstmt.setString(9, member.getAddress1());
				pstmt.setString(10, member.getAddress2());	
				pstmt.setString(11, member.getId());
				pstmt.setString(12, member.getPassword());
					chk=pstmt.executeUpdate();
				//executeUpdate (��� row�� ������ �Ǿ����� int�� ������). 1�̸� �� ��, 0�̸� �ȵ� ��
				
		}catch(Exception e) {
			
		}finally {
			close(conn,null,pstmt);
		}
		return chk;
	}
	public int getMemberCount(String memberfilter) {
		//�� ȸ�� �� count
		int x=0;
		String sql;
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
			
		try {
			if(memberfilter.equals("0")) {//��üȸ�� ��ȸ
				sql="select nvl(count(*),0) from shopmember";
				pstmt=con.prepareStatement(sql);				//���̺� �̸� �ٲٱ�!
			}else {//memberfilter�� ���� ���� ȸ�� ��ȸ
				sql="select nvl(count(*),0) from shopmember where memberlev=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, memberfilter);
			} 
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(con,rs,pstmt);
		}
		return x;
	}
	
	public List getMembers(int startRow,int endRow,String memberfilter) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List memberList=null;
		String sql="";
		conn=getConnection();

		try {
			if(memberfilter.equals("0")) {
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select num,id,name,memberlev,age,gender,buynum,reg_date "
						+ "from shopmember)a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
				
			}else{
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select num,id,name,memberlev,age,gender,buynum,reg_date "
						+ "from shopmember where memberlev=?)"
						+ "a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, memberfilter);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs=pstmt.executeQuery();
			}
			if(rs.next()) {
				memberList=new ArrayList();
				do {
					LoginDataBean member=new LoginDataBean();
					//while�� �ݺ� �� ������ ��ü ����
					member.setNum(rs.getInt("num"));
					member.setId(rs.getString("id"));
					member.setName(rs.getString("name"));
					member.setMemberlev(rs.getString("memberlev"));
					member.setAge(rs.getInt("age"));
					member.setGender(rs.getString("gender"));
					member.setBuynum(rs.getInt("buynum"));
					member.setReg_date(rs.getDate("reg_date"));
					memberList.add(member);
				}while(rs.next());
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			close(conn,rs,pstmt);
		}return memberList;
		
	}
	public LoginDataBean getMember(String id) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		LoginDataBean member=null;
		String sql="";
		try {
			conn=getConnection();

			sql="select * from shopmember where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();	
			
			if(rs.next()) {
				//true�� �� BoardDataBean�� �־����
				member=new LoginDataBean();
				member.setNum(rs.getInt("num"));
				member.setMemberlev(rs.getString("memberlev"));
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setGender(rs.getString("gender"));
				member.setBirthday(rs.getString("birthday"));
				member.setAge(rs.getInt("age"));
				member.setAddrnum(rs.getString("addrnum"));
				member.setAddress1(rs.getString("address1"));
				member.setAddress2(rs.getString("address2"));
				member.setReg_date(rs.getDate("reg_date"));
				member.setBuynum(rs.getInt("buynum"));
				member.setProductnum(rs.getInt("productnum"));

			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,rs,pstmt);
		}
		return member;
		
	}
	public int deleteMember(String id,String inputPW,String type) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		if(type.equals("admin")) {
			sql="delete from shopmember where id=?";

		}else {
			sql="delete from shopmember where id=? and password=?";
		}
		int x=-1;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			if(!type.equals("admin")) {
				pstmt.setString(2, inputPW);	
			}
			x=pstmt.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			close(conn,rs,pstmt);
		}
				
		return x;
	}
	public int loginCheck(String id,String pw) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		String dbpw="";//db���� ���� ��й�ȣ ���� ����
		conn=getConnection();

		int x=-1;
		
		try {
			sql="select password from shopmember where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			System.out.println("�Ķ���ͷ� �Ѿ��pw��:"+pw);
			if(rs.next()) {
				dbpw=rs.getString("password");
				System.out.println("dbpw��:"+dbpw);
				if(dbpw.equals(pw))
					x=1;
				else 
					x=0;
			}else {
				x=-1;
			}
			System.out.println("x�� :"+x);
			return x;
			
			
		
		}catch(Exception e) {
			throw new RuntimeException(e.getMessage());
		}finally {
			close(conn,rs,pstmt);

		}
			
	}
	
	public void close(Connection con,ResultSet rs,PreparedStatement pstmt) {
		//Ŀ�ؼ� �ݴ� �޼���
		if(rs!=null)
			try {
				rs.close();
			}catch(SQLException ex) {}
		if(pstmt!=null)
			try {
				pstmt.close();
			}catch(SQLException ex) {}
		if(con!=null)
			try {
				con.close();
			}catch(SQLException ex) {}
	}
	
	
}

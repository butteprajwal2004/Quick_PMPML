package img;
import project.*;

import java.sql.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class monthly_pass_image
 */
@MultipartConfig
@WebServlet("/monthly_pass_image")
public class monthly_pass_image extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public monthly_pass_image() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String adharId = request.getParameter("ID");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String birthdate = request.getParameter("birthdate");
		String address = request.getParameter("address");
		String mobile = request.getParameter("mobile");
		String gender = request.getParameter("gender");
		int passId = -1;
		java.util.Date currentDate = new java.util.Date();
		java.sql.Date startDate = new java.sql.Date(currentDate.getTime());

		// Get the end date (1 month from current date)
		java.util.Calendar calendar = java.util.Calendar.getInstance();
		calendar.setTime(currentDate);
		calendar.add(java.util.Calendar.MONTH, 1);
		java.util.Date endDate = calendar.getTime();
		java.sql.Date sqlEndDate = new java.sql.Date(endDate.getTime());
		Part file=request.getPart("aadhar");
		Part file1=request.getPart("photo");
		String aadharFilename=file.getSubmittedFileName();
		String photoFilename=file1.getSubmittedFileName();
		String uploadaadhar="C:/Users/Nilesh/eclipse-workspace/PMPML_MANAGEMENT/src/main/webapp/"+aadharFilename;
		String uploadphoto="C:/Users/Nilesh/eclipse-workspace/PMPML_MANAGEMENT/src/main/webapp/"+photoFilename;
		try{
		FileOutputStream fos=new FileOutputStream(uploadaadhar);
		FileOutputStream fos1=new FileOutputStream(uploadphoto);
		InputStream is=file.getInputStream();
		InputStream is1=file1.getInputStream();
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		is1.read(data);
		fos1.write(data);
		fos1.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement st = con.prepareStatement("insert into monthly_pass (adhar_id,name,email,birthdate,address,aadhar,photo,mobile,gender,start_date,end_date) values (?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			st.setString(1, adharId);
			st.setString(2, name);
			st.setString(3, email);
			st.setString(4, birthdate);
			st.setString(5, address);
			st.setString(6, aadharFilename);
			st.setString(7, photoFilename);
			st.setString(8, mobile);
			st.setString(9, gender);
			st.setDate(10, startDate);
			st.setDate(11, sqlEndDate);

			  st.executeUpdate();
			  ResultSet rs = st.getGeneratedKeys();
			  if (rs.next()) {
			    passId = rs.getInt(1);
			  }
			  st.close();
			  con.close();
			  System.out.println("YOUR DOCUMENT IS SUBMITTED SUCCESSFULLY AFTER VERIFICATION YOU GOT EMAIL FOR FURTHER PROCESS");
		        String message = "YOUR DOCUMENT IS SUBMITTED SUCCESSFULLY. AFTER VERIFICATION YOU GOT EMAIL FOR FURTHER PROCESS";
		        response.setContentType("text/html;charset=UTF-8");
		        PrintWriter out = response.getWriter();
		        out.println("<script>alert('" + message + "');</script>");
		        out.println("<script>window.location.href='Monthly_Pass1.jsp';</script>"); // replace 'your_page.jsp' with the actual page you want to redirect to
		   
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}

}


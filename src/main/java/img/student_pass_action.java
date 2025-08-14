package img;
import project.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import project.ConnectionProvider;

/**
 * Servlet implementation class student_pass_action
 */
@MultipartConfig
@WebServlet("/student_pass_action")
public class student_pass_action extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public student_pass_action() {
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
		String college = request.getParameter("college");
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
		Part file2=request.getPart("bonafide");
		String aadharFilename=file.getSubmittedFileName();
		String photoFilename=file1.getSubmittedFileName();
		String bonafideFilename=file.getSubmittedFileName();
		String uploadaadhar="C:/Users/Nilesh/eclipse-workspace/PMPML MANAGEMENT/Database_Images/student_aadhar/"+aadharFilename;
		String uploadphoto="C:/Users/Nilesh/eclipse-workspace/PMPML MANAGEMENT/Database_Images/student_photo/"+photoFilename;
		String uploadbonafide="C:/Users/Nilesh/eclipse-workspace/PMPML MANAGEMENT/Database_Images/student_bonafide/"+bonafideFilename;
		try{
		FileOutputStream fos=new FileOutputStream(uploadaadhar);
		FileOutputStream fos1=new FileOutputStream(uploadphoto);
		FileOutputStream fos2=new FileOutputStream(uploadbonafide);
		InputStream is=file.getInputStream();
		InputStream is1=file1.getInputStream();
		InputStream is2=file2.getInputStream();
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		byte[] data1=new byte[is1.available()];
		is1.read(data1);
		fos1.write(data1);
		fos1.close();
		byte[] data2=new byte[is2.available()];
		is2.read(data2);
		fos2.write(data2);
		fos.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement st = con.prepareStatement("insert into student_pass (adhar_id,name,college_school_name,email,birthdate,address,bonafide,aadhar,photo,mobile,gender,start_date,end_date) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			st.setString(1, adharId);
			st.setString(2, name);
			st.setString(3, college);
			st.setString(4, email);
			st.setString(5, birthdate);
			st.setString(6, address);
			st.setString(7, bonafideFilename);
			st.setString(8, aadharFilename);
			st.setString(9, photoFilename);
			st.setString(10, mobile);
			st.setString(11, gender);
			st.setDate(12, startDate);
			st.setDate(13, sqlEndDate);

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
		        out.println("<script>window.location.href='student_pass.jsp';</script>"); // replace 'your_page.jsp' with the actual page you want to redirect to
		   

			
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}

}


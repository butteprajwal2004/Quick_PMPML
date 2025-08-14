<%
   java.util.Date date = new java.util.Date();
   java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
   String currentDate = sdf.format(date);
%>
<%@ page import="java.io.*, java.util.*, com.itextpdf.text.*, com.itextpdf.text.pdf.* , com.itextpdf.text.pdf.PdfWriter , com.itextpdf.text.Image" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String adharId = request.getParameter("ID");
String selectedRadioButtonValue = request.getParameter("gender");
int passId = -1;


try {
	
	Connection con = ConnectionProvider.getCon();
  PreparedStatement st = con.prepareStatement("insert into daily_pass (adhar_id, gender,date) values (?, ?,?)", Statement.RETURN_GENERATED_KEYS);
  st.setInt(1, Integer.parseInt(adharId));
  st.setString(2, selectedRadioButtonValue);
  st.setString(3, currentDate);
  st.executeUpdate();

  // Get the generated pass_id
  ResultSet rs = st.getGeneratedKeys();
  if (rs.next()) {
    passId = rs.getInt(1);
  }
  st.close();
  con.close();
	} catch (Exception e) {
  out.println(e.getMessage());
}


ByteArrayOutputStream baos = new ByteArrayOutputStream();
com.itextpdf.text.Document doc=new com.itextpdf.text.Document();
try{
	
	PdfWriter writer = PdfWriter.getInstance(doc, baos);
  doc.open();
  
  Font font = new Font(Font.FontFamily.TIMES_ROMAN, 30, Font.BOLD, new BaseColor(255, 0, 0));
  Paragraph paragraph1 = new Paragraph("PMPML DAILY PASS", font);
  paragraph1.setAlignment(Element.ALIGN_CENTER);
  doc.add(paragraph1);
  Font font1 = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
  Paragraph paragraph2 = new Paragraph("Pune Mahanagar Pariavahan Mahamandal Limited", font1);
  paragraph2.setAlignment(Element.ALIGN_CENTER);
  doc.add(paragraph2);
  Image image = Image.getInstance("logo3.jpg");
  float width = doc.getPageSize().getWidth() / 2;
  float height = doc.getPageSize().getHeight() / 2;
  image.scaleAbsolute(width, height);
  image.setAbsolutePosition((doc.getPageSize().getWidth() - width) / 2, (doc.getPageSize().getHeight() - height) / 2);

  PdfContentByte contentByte = writer.getDirectContent();
  PdfGState gState = new PdfGState();
  gState.setFillOpacity(0.1f);
  contentByte.setGState(gState);
  contentByte.addImage(image);
  Font font3 = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD);
  Paragraph p11 = new Paragraph("\n\n\n ");
  doc.add(p11);
  Paragraph p5 = new Paragraph("PASS ID: ",font3);
  p5.setAlignment(Element.ALIGN_CENTER);
  doc.add(p5);
  Paragraph p6 = new Paragraph(Integer.toString(passId));
  p6.setAlignment(Element.ALIGN_CENTER);
  doc.add(p6);
  Paragraph p7 = new Paragraph("\n");
  doc.add(p7);
  Paragraph p1 = new Paragraph("ADHAR NUMBER: ",font3);
  p1.setAlignment(Element.ALIGN_CENTER);
  doc.add(p1);
  Paragraph p12 = new Paragraph(adharId);
  p12.setAlignment(Element.ALIGN_CENTER);
  doc.add(p12);
  Paragraph p21 = new Paragraph("\n");
  doc.add(p21);
  Paragraph p2 = new Paragraph("GENDER: ",font3);
  p2.setAlignment(Element.ALIGN_CENTER);
  doc.add(p2);
  Paragraph p22 = new Paragraph(selectedRadioButtonValue);
  p22.setAlignment(Element.ALIGN_CENTER);
  doc.add(p22);
  Paragraph p24 = new Paragraph("\n");
  doc.add(p24);
  Paragraph p10 = new Paragraph("VALID DATE: ",font3);
  p10.setAlignment(Element.ALIGN_CENTER);
  doc.add(p10);
  Paragraph p111 = new Paragraph(currentDate);
  p111.setAlignment(Element.ALIGN_CENTER);
  doc.add(p111);
  Font font4 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
  Paragraph p211 = new Paragraph("\n\n\n\n\nRules:-",font3);
  doc.add(p211);
  Paragraph p25 = new Paragraph("## This Pass Is Valid Upto 11:59 PM Of Valid Date",font4);

  doc.add(p25);
  Paragraph p26 = new Paragraph("## This Pass Should be Verify From Conductor When You Enter In PMPML ",font4);

  doc.add(p26);
  Paragraph p27 = new Paragraph("## Follow The above Rules For Your Safety And Confirmation Of Pass ",font4);

  doc.add(p27);
  
  doc.close();
} catch (Exception e){
  out.println(e.getMessage());
}
        
%>
<%
response.setHeader("Content-Disposition", "inline; filename=" + passId + ".pdf");
response.setContentType("application/pdf");
response.setContentLength(baos.size());

ServletOutputStream outputStream = response.getOutputStream();
baos.writeTo(outputStream);
outputStream.flush();
outputStream.close();
%>






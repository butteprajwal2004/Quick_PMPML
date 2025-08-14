<%
   java.util.Date date = new java.util.Date();
   java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
   String currentDate = sdf.format(date);
%>
<%@ page import="java.io.*, java.util.*, com.itextpdf.text.*, com.itextpdf.text.pdf.* , com.itextpdf.text.pdf.PdfWriter , com.itextpdf.text.Image" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String mobile_no = request.getParameter("ID");
String gender = request.getParameter("gender");
String route_no = request.getParameter("route_no");
String source = request.getParameter("source");
String destination = request.getParameter("destination");
String bus_id = request.getParameter("bus_id");
String amount = request.getParameter("amount");

int ticket_id = -1;


try {
	
	Connection con = ConnectionProvider.getCon();
  PreparedStatement st = con.prepareStatement("insert into book_my_ticket (mobile_no, gender,route_no,source,destination,bus_id,amount,date) values (?, ?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
  st.setString(1, mobile_no);
  st.setString(2, gender);
  st.setString(3, route_no);
  st.setString(4, source);
  st.setString(5, destination);
  st.setString(6, bus_id);
  st.setString(7, amount);
  st.setString(8, currentDate);

  st.executeUpdate();

  // Get the generated pass_id
  ResultSet rs = st.getGeneratedKeys();
  if (rs.next()) {
    ticket_id = rs.getInt(1);
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
  Paragraph paragraph1 = new Paragraph("PMPML TICKET", font);
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
  Paragraph p5 = new Paragraph("TICKET ID: ",font3);
  p5.setAlignment(Element.ALIGN_CENTER);
  doc.add(p5);
  Paragraph p6 = new Paragraph(Integer.toString(ticket_id));
  p6.setAlignment(Element.ALIGN_CENTER);
  doc.add(p6);
  Paragraph p7 = new Paragraph("\n");
  doc.add(p7);
  
  Paragraph p1 = new Paragraph("MOBILE NUMBER: ",font3);
  p1.setAlignment(Element.ALIGN_CENTER);
  doc.add(p1);
  Paragraph p12 = new Paragraph(mobile_no);
  p12.setAlignment(Element.ALIGN_CENTER);
  doc.add(p12);
  Paragraph p21 = new Paragraph("\n");
  doc.add(p21);
  Paragraph p2 = new Paragraph("GENDER: ",font3);
  p2.setAlignment(Element.ALIGN_CENTER);
  doc.add(p2);
  Paragraph p22 = new Paragraph(gender);
  p22.setAlignment(Element.ALIGN_CENTER);
  doc.add(p22);
  Paragraph p24 = new Paragraph("\n");
  doc.add(p24);
  Paragraph p10 = new Paragraph("TICKET DATE: ",font3);
  p10.setAlignment(Element.ALIGN_CENTER);
  doc.add(p10);
  Paragraph p111 = new Paragraph(currentDate);
  p111.setAlignment(Element.ALIGN_CENTER);
  doc.add(p111);
  Paragraph t1 = new Paragraph("\n");
  doc.add(t1);
  Paragraph p101 = new Paragraph("SOURCE: ",font3);
  p101.setAlignment(Element.ALIGN_CENTER);
  doc.add(p101);
  Paragraph p1111 = new Paragraph(source);
  p1111.setAlignment(Element.ALIGN_CENTER);
  doc.add(p1111);
  Paragraph t2 = new Paragraph("\n");
  doc.add(t2);
  Paragraph d1 = new Paragraph("DESTINATION: ",font3);
  d1.setAlignment(Element.ALIGN_CENTER);
  doc.add(d1);
  Paragraph d2 = new Paragraph(destination);
  d2.setAlignment(Element.ALIGN_CENTER);
  doc.add(d2);
  Paragraph t3 = new Paragraph("\n");
  doc.add(t3);
  Paragraph d11 = new Paragraph("AMOUNT PAID: ",font3);
  d11.setAlignment(Element.ALIGN_CENTER);
  doc.add(d11);
  Paragraph d21 = new Paragraph(amount);
  d21.setAlignment(Element.ALIGN_CENTER);
  doc.add(d21);
  Paragraph t4 = new Paragraph("\n");
  doc.add(t4);
  Paragraph b1 = new Paragraph("BUS ID: ",font3);
  b1.setAlignment(Element.ALIGN_CENTER);
  doc.add(b1);
  Paragraph b2 = new Paragraph(bus_id);
  b2.setAlignment(Element.ALIGN_CENTER);
  doc.add(b2);
  Font font4 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
  Paragraph p211 = new Paragraph("\n\nRules:-",font3);
  doc.add(p211);
  Paragraph p25 = new Paragraph("## This Ticket Is Valid For Only Today",font4);

  doc.add(p25);
  Paragraph p26 = new Paragraph("## This Ticket Should be Verify From Conductor When You Enter In PMPML ",font4);

  doc.add(p26);
  Paragraph p27 = new Paragraph("## Follow The above Rules For Your Safety And Confirmation Of Ticket ",font4);

  doc.add(p27);
  
  doc.close();
} catch (Exception e){
  out.println(e.getMessage());
}
        
%>
<%
response.setHeader("Content-Disposition", "inline; filename=" + ticket_id + ".pdf");
response.setContentType("application/pdf");
response.setContentLength(baos.size());

ServletOutputStream outputStream = response.getOutputStream();
baos.writeTo(outputStream);
outputStream.flush();
outputStream.close();
%>






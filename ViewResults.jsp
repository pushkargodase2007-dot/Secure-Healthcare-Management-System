<%@page import="java.util.Base64"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="java.security.Key"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="HealthCare.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Secure and Lightweight Fine-Grained Searchable Data Sharing for IoT-Oriented and Cloud-Assisted Smart Healthcare System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">  

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/table.css" rel="stylesheet">
    </head>
    <%
        if (request.getParameter("Approved") != null) {%>
    <script>alert('Access Approved');</script>  
    <%}
    %>

    <%
        if (request.getParameter("Rejected") != null) {%>
    <script>alert('Access Rejected');</script>  
    <%}
    %>
    <body>
        <!-- Navbar Start -->
        <div class="container-fluid sticky-top bg-white shadow-sm">
            <div class="container">
                <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
                    <a href="#" class="navbar-brand">
                        <h1 class="m-0 text-uppercase text-primary"><i class="fa fa-clinic-medical me-2"></i></h1>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <div class="navbar-nav ms-auto py-0">
                            <a href="DoctorHome.jsp" class="nav-item nav-link ">Home</a>
                            <a href="SearchRecord.jsp" class="nav-item nav-link">Search Record</a>
                            <a href="RequestStatus.jsp" class="nav-item nav-link active ">Request Status</a>
                            <a href="DocAccessDetails.jsp" class="nav-item nav-link">Access Details</a>
                            <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->
        <%
            String pid = request.getParameter("pid");
            String accesspol = request.getParameter("accesspol");
            String checkkey = request.getParameter("ss");
        %>

        <%!
            public static final String ALGO = "AES";
            public static final String key = "";
            public static byte[] keyValue = key.getBytes();
        %>
        <%!
            public static String encryption(String data) throws Exception {
                Key key = generateKey();
                Cipher c = Cipher.getInstance(ALGO);
                c.init(Cipher.ENCRYPT_MODE, key);
                byte[] encVal = c.doFinal(data.getBytes());
                return Base64.getEncoder().encodeToString(encVal);
            }

            public static String decryption(String encryptedData) throws Exception {
                Key key = generateKey();
                Cipher c = Cipher.getInstance(ALGO);
                c.init(Cipher.DECRYPT_MODE, key);
                byte[] decordedValue = Base64.getDecoder().decode(encryptedData);
                byte[] decValue = c.doFinal(decordedValue);
                return new String(decValue);
            }

            public static Key generateKey() throws Exception {
                return new SecretKeySpec(keyValue, ALGO);
            }

        %>

        <%
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("Select * from medicalrecords where pid ='" + pid + "'");
            rs.next();
            String skey = rs.getString("skey");
            System.out.println("key " + skey);

            String mdetails = rs.getString("pmedications");
            String blood = rs.getString("blood");
            String bp = rs.getString("bp");
            String btemp = rs.getString("btemp");
            String pulserate = rs.getString("pulserate");
            String uploaddate = rs.getString("uploaddate");
            String uptime = rs.getString("uptime");
            keyValue = skey.getBytes();
            String mdetail = decryption(mdetails);
            String blood1 = decryption(blood);
            String bp1 = decryption(bp);
            String btemp1 = decryption(btemp);
            String pulserate1 = decryption(pulserate);
            String uploaddate1 = decryption(uploaddate);
            String uptime1 = decryption(uptime);

            if (skey.equalsIgnoreCase(checkkey) == false) {
                response.sendRedirect("RequestStatus.jsp?Incorrect");
            }

            if (accesspol.equalsIgnoreCase("read")) {
        %>
        <div class="container-fluid pt-5">
            <div class="container">
                <br><br><br><br>
                <center><h1>Patient Records(Read Only)</h1></center>
                <br><br><br><br><br><br>
                <div class="row justify-content-center position-relative" style="margin-top: -200px; z-index: 1;">
                    <div class="col-lg-8">
                        <div class="bg-white rounded p-5 m-5 mb-0">
                            <form action="medicaldata" method="post">
                                <div class="row g-3">
                                    <div class="col-12 col-sm-6"> 
                                        <label>Blood Group</label>
                                        <input type="text" class="form-control bg-light border-0" readonly="" required="" value="<%=blood1%>" placeholder="Blood Group" style="height: 55px;">
                                    </div>

                                    <div class="col-12 col-sm-6"> 
                                        <label>Blood Pressure</label>
                                        <input type="text" class="form-control bg-light border-0" readonly=""  required="" value="<%=bp1%>" placeholder="Blood Pressure" style="height: 55px;">
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <label>Body Temperature</label>
                                        <input type="text" class="form-control bg-light border-0" readonly=""required="" value="<%=btemp1%>" placeholder="Body Temperature" style="height: 55px;">
                                    </div>

                                    <div class="col-12 col-sm-6"> 
                                        <label>Pulse Rate</label>
                                        <input type="text" class="form-control bg-light border-0" readonly="" required="" value="<%=pulserate1%>" placeholder="Pulse Rate" style="height: 55px;">
                                    </div>

                                    <div class="col-12 col-sm-6"> 
                                        <label>Upload Date</label>
                                        <input type="text" class="form-control bg-light border-0" readonly=""  required="" value="<%=uploaddate1%>" placeholder="Pulse Rate" style="height: 55px;">
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <label>Upload Time</label>
                                        <input type="text" class="form-control bg-light border-0" readonly="" required="" value="<%=uptime1%>" placeholder="Pulse Rate" style="height: 55px;">
                                    </div>

                                    <div class="col-12"> 
                                        <label>Medications</label>
                                        <textarea class="form-control bg-light border-0" rows="5" required="" readonly="" name="mdetails" placeholder="Medications"><%=mdetail%></textarea>
                                    </div>
                            </form>
                            <br><br><br><br><br>


                        </div>
                    </div>
                </div>
            </div>

        </div>

        <%
        } else {
        %>
        <div class="container-fluid pt-5">
            <div class="container">
                <br><br><br><br>
                <center><h1>Patient Records(Read/Write)</h1></center>
                <br><br><br><br><br><br>
                <div class="row justify-content-center position-relative" style="margin-top: -200px; z-index: 1;">
                    <div class="col-lg-8">
                        <div class="bg-white rounded p-5 m-5 mb-0">
                            <form action="Updatemdata" method="post">
                                <input type="hidden" value="<%=pid%>" name="pid">
                                <input type="hidden" value="<%=skey%>" name="skey">
                                <div class="row g-3">

                                    <div class="col-12 col-sm-6"> 
                                        <label>Blood Group</label>
                                        <input type="text" class="form-control bg-light border-0" readonly="" required="" value="<%=blood1%>" placeholder="Blood Group" style="height: 55px;">
                                    </div>

                                    <div class="col-12 col-sm-6"> 
                                        <label>Blood Pressure</label>
                                        <input type="text" class="form-control bg-light border-0" readonly=""  required="" value="<%=bp1%>" placeholder="Blood Pressure" style="height: 55px;">
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <label>Body Temperature</label>
                                        <input type="text" class="form-control bg-light border-0" readonly=""required="" value="<%=btemp1%>" placeholder="Body Temperature" style="height: 55px;">
                                    </div>

                                    <div class="col-12 col-sm-6"> 
                                        <label>Pulse Rate</label>
                                        <input type="text" class="form-control bg-light border-0" readonly="" required="" value="<%=pulserate1%>" placeholder="Pulse Rate" style="height: 55px;">
                                    </div>

                                    <div class="col-12 col-sm-6"> 
                                        <label>Upload Date</label>
                                        <input type="text" class="form-control bg-light border-0" readonly=""  required="" value="<%=uploaddate1%>" placeholder="Pulse Rate" style="height: 55px;">
                                    </div>

                                    <div class="col-12 col-sm-6">
                                        <label>Upload Time</label>
                                        <input type="text" class="form-control bg-light border-0" readonly="" required="" value="<%=uptime1%>" placeholder="Pulse Rate" style="height: 55px;">
                                    </div>

                                    <div class="col-12"> 
                                        <label>Medications</label>
                                        <textarea class="form-control bg-light border-0" rows="5" required="" name="mdetails" placeholder="Previous Medications"><%=mdetail%></textarea>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100 py-3" type="submit">Update</button>
                                    </div>
                                </div>
                            </form>
                            <br><br><br><br><br>


                        </div>
                    </div>
                </div>
            </div>

        </div>
        <% }
        %>

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light mt-5 py-5">
        </div>
        <div class="container-fluid bg-dark text-light border-top border-secondary py-4">
            <div class="container">
                <div class="row g-5">
                    <div class="col-md-6 text-center text-md-start">
                        <p class="mb-md-0">&copy; <a class="text-primary" href="#">Smart Healthcare System</a>. All Rights Reserved.</p>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <p class="mb-0"></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>



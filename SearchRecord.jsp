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
    </head>
        <%
          if (request.getParameter("failed") != null) {%>
    <script>alert('Not Found');</script>  
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
                            <a href="DoctorHome.jsp" class="nav-item nav-link active ">Home</a>
                            <a href="SearchRecord.jsp" class="nav-item nav-link">Search Record</a>
                            <a href="RequestStatus.jsp" class="nav-item nav-link">Request Status</a>
                            <a href="DocAccessDetails.jsp" class="nav-item nav-link">Access Details</a>
                            <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

            <style>
                .buttons a {
                    font-size: 16px;
                    color: black;
                }
                .buttons a:hover {
                    cursor:pointer; 
                    font-size: 16px;
                    color: #0dcaf0;
                }
            </style>
        <!-- Hero Start -->
        <br><br><br>
   <div class="container-fluid pt-5">
            <div class="container">
                <div class="row justify-content-center position-relative" style="margin-top: -200px; z-index: 1;">
                    <div class="col-md-12">
                        <br> <br> <br> <br> <br> <br> <br>
                        <center><h1>Search Medical Records</h1></center>
                        <br>
                        <div style="margin: auto;padding: 10px;">
                            <div class="main_div">
                            <div class="buttons" style="margin-left: 340px">
                                <a href="#" onclick="divVisibility('Div1');">Search By Name</a> | 
                                <a href="#" onclick="divVisibility('Div2');">Search By Phone</a> | 
                                <a href="#" onclick="divVisibility('Div3');">Search By Patient ID</a> | 
                            </div>
                            <br>
                            <br>
                            <div class="inner_div">

                                <div class="col-lg-6 col-8" id="Div1" style="margin-left: 300px">

                                    <form class="custom-form volunteer-form mb-5 mb-lg-0" action="sname.jsp" method="post" role="form">
                                        <center><h3 class="mb-4">Search By Name</h3></center>

                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" class="form-control bg-light border-0" name="sname" required="" id="volunteer-name"  placeholder="Search Name" style="height: 55px;">
                                            </div>
                                        </div>
                                        <br>
                                        <center><div class="col-5">
                                          <button class="btn btn-primary w-100 py-3" type="submit">Submit</button>
                                            </div></center>
                                    </form>
                                </div>
                                <div class="col-lg-6 col-8" id="Div2"  style="margin-left: 300px;display: none;">

                                    <form class="custom-form volunteer-form mb-5 mb-lg-0" action="sphone.jsp" method="post" role="form">
                                        <center><h3 class="mb-4">Search By Phone</h3></center>

                                        <div class="row">
                                            <div class="col-12">
                                               <input type="text" class="form-control bg-light border-0" name="sphone" required="" id="volunteer-name"  placeholder="Search Phone" style="height: 55px;">
                                            </div>
                                        </div>
                                        <br>
                                       <center><div class="col-5">
                                          <button class="btn btn-primary w-100 py-3" type="submit">Submit</button>
                                            </div></center>
                                    </form>

                                </div>
                                <div class="col-lg-6 col-8" id="Div3"  style="margin-left: 300px;display: none;">

                                    <form class="custom-form volunteer-form mb-5 mb-lg-0" action="spid.jsp" method="post" role="form">
                                        <center><h3 class="mb-4">Search By Patient ID</h3></center>
                                        <div class="row">
                                            <div class="col-md-12">
                                               <input type="text" class="form-control bg-light border-0" name="spid" required="" id="volunteer-name"  placeholder="Search Patient ID" style="height: 55px;">
                                            </div>
                                        </div>
                                        <br>
                                        <center><div class="col-5">
                                          <button class="btn btn-primary w-100 py-3" type="submit">Submit</button>
                                            </div></center>
                                    </form>

                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>

        </div><br><br><br><br><br>

    <!-- Services End -->
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
 <script>
            var divs = ["Div1", "Div2", "Div3"];
            var visibleDivId = null;
            function divVisibility(divId) {
                if (visibleDivId === divId) {
                    visibleDivId = null;
                } else {
                    visibleDivId = divId;
                }
                hideNonVisibleDivs();
            }
            function hideNonVisibleDivs() {
                var i, divId, div;
                for (i = 0; i < divs.length; i++) {
                    divId = divs[i];
                    div = document.getElementById(divId);
                    if (visibleDivId === divId) {
                        div.style.display = "block";
                    } else {
                        div.style.display = "none";
                    }
                }
            }
        </script>

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



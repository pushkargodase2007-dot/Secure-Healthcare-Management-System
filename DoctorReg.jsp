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

    <body>

        <!-- Navbar Start -->
        <div class="container-fluid sticky-top bg-white shadow-sm">
            <div class="container">
                <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
                    <a href="" class="navbar-brand">
                        <h1 class="m-0 text-uppercase text-primary"><i class="fa fa-clinic-medical me-2"></i>Healthcare System</h1>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <div class="navbar-nav ms-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link ">Home</a>
                            <a href="Patient.jsp" class="nav-item nav-link">Patient</a>
                            <a href="Doctor.jsp" class="nav-item nav-link active">Doctor</a>
                            <a href="HAC.jsp" class="nav-item nav-link">Healthcare Administration(HAC)</a>
                            <a href="CloudService.jsp" class="nav-item nav-link">HCSP</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Hero End -->
        <div class="container-fluid pt-5">
            <div class="container">
                <br><br><br><br>
                <center><h1>Doctor Registration</h1></center>
                <br><br><br><br><br><br>
                <div class="row justify-content-center position-relative" style="margin-top: -200px; z-index: 1;">
                    <div class="col-lg-8">
                        <div class="bg-white rounded p-5 m-5 mb-0">
                            <form action="DoctorReg" method="post">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <input type="text" name="name" class="form-control bg-light border-0" required="" placeholder="Your Name" style="height: 55px;">
                                    </div>
                                    <div class="col-12">
                                        <input type="email" name="email" class="form-control bg-light border-0" required="" placeholder="Your Email" style="height: 55px;">
                                    </div>
                                    <div class="col-12">
                                        <input type="text" name="phone" class="form-control bg-light border-0" required="" placeholder="Your Phone" style="height: 55px;">
                                    </div>
                                    <div class="col-12">
                                        <input type="text" name="address" class="form-control bg-light border-0" required="" placeholder="Your Address" style="height: 55px;">
                                    </div>
                                    <div class="col-12">
                                        <input type="password" name="pass" class="form-control bg-light border-0" required="" placeholder="Password" style="height: 55px;">
                                    </div>
                                    <center> <div class="col-5">
                                            <button class="btn btn-primary w-100 py-3" type="submit">Register</button>
                                        </div></center>
                                </div>
                                <center><br><a href="Doctor.jsp" style="color: red">Doctor Login</a></center>
                            </form>
                            <br><br><br><br><br>


                        </div>
                    </div>
                </div>
            </div>

        </div>

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


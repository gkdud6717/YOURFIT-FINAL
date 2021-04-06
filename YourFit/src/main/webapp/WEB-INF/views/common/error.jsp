<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

    <title>에러 페이지</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script> 

</head>
<body>

    <c:import url="../common/header.jsp"/>

        <div class="page-title">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <h2><i class="fa fa-question"></i> Not Found</h2>
                    </div><!-- end col -->
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item active">Not Found</li>
                        </ol>
                    </div><!-- end col -->                    
                </div><!-- end row -->
            </div><!-- end container -->
        </div><!-- end page-title -->

        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-wrapper">
                            <div class="notfound">   
                                <div class="row">
                                    <div class="col-md-8 offset-md-2 text-center">
                                        <h2>404</h2>
                                        <h3>Oh no! Page Not Found</h3>
                                        <p>관리자에게 문의바람</p>
                                        <a href="#" class="btn btn-primary">Back to Home</a>
                                    </div>
                                </div>
                            </div>
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>

        

        <div class="dmtop">Scroll to Top</div>
        
      <c:import url="../common/footer.jsp"/>
        
    </div><!-- end wrapper -->
    
    <!-- Core JavaScript
    ================================================== -->
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/js/tether.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

</body>
</html>
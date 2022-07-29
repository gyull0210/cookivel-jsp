<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 페이지::슬라이드 조회</title>

    <!-- Custom fonts for this template -->
    <link href="../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../../resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="../admin.sidebar.inc.jsp"/>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->                
                <jsp:include page="../admin.topbar.inc.jsp"/>    
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">슬라이드 조회</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="row mb-3">
    							<label for="slideTitle" class="col-sm-2 col-form-label">제목</label>
    							<div class="col-sm-10">
      							<input type="text" class="form-control" id="slideTitle" name="slide_title">
    							</div>
  							</div>
  							<div class="row mb-3">
    							<label for="slideTitle" class="col-sm-2 col-form-label">종류</label>
    							<div class="col-sm-10">
      							<input type="radio" name="category"> 공지사항
      							<input type="radio" name="category"> 이벤트
      							<input type="radio" name="category"> 공모전
      							<input type="radio" name="category"> 작품홍보
    							</div>
  							</div>
  							<div class="row mb-3">
    							<label for="slideTitle" class="col-sm-2 col-form-label">게시물 선택</label>
    							<div class="col-sm-10">
      							<input list="postList" class="form-control">
									<datalist id="postList">
    									<option value="봄맞이 작품 선별전">
    									<option value="사이트 이용 고지 안내">
    									<option value="오늘부터 일주일간 매일 기다리면 무료">
									</datalist>
    							</div>
  							</div>
  							<div class="row mb-3">
    							<label for="slideTitle" class="col-sm-2 col-form-label">슬라이드 업로드</label>
    							<div class="col-sm-10">
      								<input type="file" class="form-control">
    							</div>
  							</div>
  							<div class="row mb-3">
    							<label for="slideTitle" class="col-sm-2 col-form-label">미리보기</label>
    							<div class="col-sm-10">
      								<img class="rounded" src="https://via.placeholder.com/500X300">
    							</div>
  							</div>
  							<div class="row mb-3">
    							<label for="slideTitle" class="col-sm-2 col-form-label">메인 미리보기</label>
    							<div class="col-sm-10">
      								<img class="rounded" src="https://via.placeholder.com/500X300">
    							</div>
  							</div> 
  							<div class="row mb-3">
    							<label for="slideTitle" class="col-sm-2 col-form-label">시작일</label>
    							<div class="col-sm-10">
      							<input type="date" class="form-control">
    							</div>
  							</div> 
  							<div class="row mb-3">
    							<label for="slideTitle" class="col-sm-2 col-form-label">종료일</label>
    							<div class="col-sm-10">
      							<input type="date" class="form-control">
    							</div>
  							</div>
  							<div>
  								<button class="btn btn-primary">슬라이드 등록</button>
  							</div>                
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../../resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="../../resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../../resources/js/demo/datatables-demo.js"></script>

</body>

</html>
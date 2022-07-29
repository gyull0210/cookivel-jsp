<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/dashboard">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fa-solid fa-cookie-bite"></i>
                </div>
                <div class="sidebar-brand-text mx-3">COOKIVEL</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>대시보드	</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMain"
                    aria-expanded="true" aria-controls="collapseMain">
                   <i class="fas fa-fw fa-home"></i>
                    <span>메인 관리</span>
                </a>
                <div id="collapseMain" class="collapse" aria-labelledby="headingMain" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">메인 관리</h6>
                        <a class="collapse-item" href="buttons.html">메인 슬라이드 관리</a>
                        <a class="collapse-item" href="cards.html">작품 슬라이드 관리</a>
                    </div>
                </div>
            </li>
                        
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMember"
                    aria-expanded="true" aria-controls="collapseMember">
                    <i class="fas fa-fw fa-users"></i>
                    <span>회원 관리</span>
                </a>
                <div id="collapseMember" class="collapse" aria-labelledby="headingMember" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">회원 관리</h6>
                        <a class="collapse-item" href="/admin/member/memberList">회원 목록</a>
                        <a class="collapse-item" href="cards.html">관리자 목록</a>
                        <a class="collapse-item" href="cards.html">코드 등록</a>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBook"
                    aria-expanded="true" aria-controls="collapseBook">
                    <i class="fa-solid fa-fw fa-book"></i>
                    <span>작품 관리</span>
                </a>
                <div id="collapseBook" class="collapse" aria-labelledby="headingBook" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">작품 관리</h6>
                        <a class="collapse-item" href="buttons.html">자유 연재작</a>
                        <a class="collapse-item" href="cards.html">작가 연재작</a>
                        <a class="collapse-item" href="cards.html">연재 이벤트 관리</a>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseNotice"
                    aria-expanded="true" aria-controls="collapseNotice">
                    <i class="fas fa-fw fa-microphone"></i>
                    <span>공지 관리</span>
                </a>
                <div id="collapseNotice" class="collapse" aria-labelledby="headingNotice" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">게시판 관리</h6>
                        <a class="collapse-item" href="buttons.html">공지사항 목록</a>
                        <a class="collapse-item" href="cards.html">게시글 관리</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseHelpdesk"
                    aria-expanded="true" aria-controls="collapseHelpdesk">
                    <i class="fas fa-fw fa-headset"></i>
                    <span>고객센터 관리</span>
                </a>
                <div id="collapseHelpdesk" class="collapse" aria-labelledby="headingHelpdesk" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">고객센터 관리</h6>
                        <a class="collapse-item" href="buttons.html">고객센터 메인</a>
                        <a class="collapse-item" href="cards.html">문의 목록</a>
                    </div>
                </div>
            </li>
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Utilities</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="${pageContext.request.contextPath}/resources/img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>쿠키블</strong> 메세지</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">?</a>
            </div>

        </ul>
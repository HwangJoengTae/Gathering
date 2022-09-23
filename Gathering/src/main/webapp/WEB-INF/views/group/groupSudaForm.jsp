<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>One Page Wonder - Start Bootstrap Template</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
        rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
        rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css" rel="stylesheet" />

	<script type="text/javascript" src="../js/qna.js"></script>

</head>

<body id="page-top">
     <%@ include file="/WEB-INF/views/navibar.jsp" %>
    
    <!--사이드바 시작구간-->
    <div class="container-fluid">
        <div class="row">
            <nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#"> <span data-feather="home"></span>
								모임상세
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span> 모임공지
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/group/groupAlbum"> <span data-feather="shopping-cart"></span>
								모임앨범
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/group/groupSuda"> <span
								data-feather="users"></span> 모임수다
						</a></li>
					


					</ul>
				</div>
			</nav>
            <!--메인구간 -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		



                <h2 style="padding-top:5%">수다방 만들기</h2>


				<form action="/insertSuda" id="formm" name="formm" method="post">
				<input type="hidden" name="group_seq" value="${sudaVO.group_seq}">
			
                        <!--주제-->
                        <div class="row mb-2">
                            <label for="input_crew_notice_detail" class="col-sm-2 col-form-label">수다 주제</label>
                            <div class="col-auto">
                                <textarea class="form-control" id="content" name="content" cols="40"
                                    rows="3" placeholder="주제를 작성해 주세요." style="resize:none;"></textarea>
                            </div>
                        </div>
 
                   </form>
                   
                      


                        <!--버튼-->
                        <div class="row">
                            <div class="col text-center">
                                <button class="btn btn-primary" type="button" id="qna_insert" onclick="suda_save()" >등록</button>
                                <button class="btn btn-primary" type="button" onclick="location.href='/group/groupSuda?group_seq=${sudaVO.group_seq}'">취소</button>
                            </div>
                        </div>

                
            </main>

        </div>
    </div>

    
  <%@ include file="/WEB-INF/views/footer.jsp" %>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
	<script>
	 //수다 작성 빈칸 체크 
	 function suda_save() {
		
		 var form =document.formm;
			
			
			form.submit();
			
			
		}
	</script>
	





</body>

</html>
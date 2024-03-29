<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
 <meta charset="utf-8">
   
    <!-- SEO Meta Tags-->
    <meta name="description" content="Finder - Directory &amp; Listings Bootstrap Template">
    <meta name="keywords" content="bootstrap, business, directory, listings, e-commerce, car dealer, city guide, real estate, job board, user account, multipurpose, ui kit, html5, css3, javascript, gallery, slider, touch">
    <meta name="author" content="Createx Studio">
    <!-- Viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon and Touch Icons-->
    <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
    <link rel="manifest" href="site.webmanifest">
    <link rel="mask-icon" color="#5bbad5" href="safari-pinned-tab.svg">
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bbs.css" />
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bbss.css" />
    <meta name="msapplication-TileColor" content="#766df4">
    <meta name="theme-color" content="#ffffff">
    <!-- Page loading styles-->
    <style>
      .page-loading {
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100%;
        -webkit-transition: all .4s .2s ease-in-out;
        transition: all .4s .2s ease-in-out;
        background-color: #fff;
        opacity: 0;
        visibility: hidden;
        z-index: 9999;
      }
      .page-loading.active {
        opacity: 1;
        visibility: visible;
      }
      .page-loading-inner {
        position: absolute;
        top: 50%;
        left: 0;
        width: 100%;
        text-align: center;
        -webkit-transform: translateY(-50%);
        transform: translateY(-50%);
        -webkit-transition: opacity .2s ease-in-out;
        transition: opacity .2s ease-in-out;
        opacity: 0;
      }
      .page-loading.active > .page-loading-inner {
        opacity: 1;
      }
      .page-loading-inner > span {
        display: block;
        font-size: 1rem;
        font-weight: normal;
        color: #666276;;
      }
      .page-spinner {
        display: inline-block;
        width: 2.75rem;
        height: 2.75rem;
        margin-bottom: .75rem;
        vertical-align: text-bottom;
        border: .15em solid #bbb7c5;
        border-right-color: transparent;
        border-radius: 50%;
        -webkit-animation: spinner .75s linear infinite;
        animation: spinner .75s linear infinite;
      }
      @-webkit-keyframes spinner {
        100% {
          -webkit-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      @keyframes spinner {
        100% {
          -webkit-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      
    </style>

    <!-- Vendor Styles-->
    <link rel="stylesheet" media="screen" href="vendor/simplebar/dist/simplebar.min.css"/>
    <link rel="stylesheet" media="screen" href="vendor/lightgallery/css/lightgallery-bundle.min.css"/>
    <link rel="stylesheet" media="screen" href="vendor/tiny-slider/dist/tiny-slider.css"/>
    <link rel="stylesheet" media="screen" href="vendor/flatpickr/dist/flatpickr.min.css"/>
    <!-- Main Theme Styles + Bootstrap-->
</head>

<body>
	<c:set var="detail" value="${roomReviewDetail}"/>
	<form class="needs-validation"  id="reviewFormValue" enctype="multipart/form-data" name="form" method="post" action="roomReviewModify">
	<input type="hidden" name="id" value="${sessionScope.id }">
	<input type="hidden" name="room_rev_id" value="${room_rev_id }">
	<input type="hidden" name="room_id" value="${room_id }">
	<input type="hidden" name="page" value="${page }">
				    
		<div class="mb-4" align="center" >  	 
		    <!-- 별점 -->      
		   		<div class="starpoint_wraps">		    
		 			<div class="starpoint_boxs" id="star1">      

		 				<c:forEach var="i" begin="1" end="10">
		 					<c:if test="${detail.rev_rate*2 == i }">
					 			<input type="radio" name="starpoint" id="starpoint_${i}" class="star_radio" value="${i/2}"  checked > 
 					    		<label for="starpoint_${i}"  class="label_star" title="${i/2}"><span class="blind">${i/2}점</span></label> 
		 					</c:if>
		 					<c:if test="${detail.rev_rate*2 != i }">
		 						<input type="radio" name="starpoint" id="starpoint_${i}" class="star_radio" value="${i/2}"   > 
 					    		<label for="starpoint_${i}"  class="label_star" title="${i/2}"><span class="blind">${i/2}점</span></label> 
		 					</c:if>
 					    </c:forEach>
 					    <span class="starpoint_bg" ></span> 			    
		  			</div>
				</div>
			</div>	
					
            <div class="mb-4">
            	<label class="form-label" for="review-text">리뷰 <span class='text-danger'>*</span></label>
            	<textarea class="form-control" id="rev_content" rows="5" id="rev_content" name="rev_content"  required>${detail.rev_content}</textarea>
           		<div class="invalid-feedback">리뷰를 작성해주세요.</div>
            </div>
            
            <div class="mb-4">
            	<c:forTokens var="photo" items="${detail.rev_photo}" delims=",">
					<img src="<%=request.getContextPath()%>/upload/${photo}" height="100" width="100"/>
				</c:forTokens>
			</div>
			
			<div class="mb-4">
            	<input class="form-control" type="file" name="rev_photos1" id="rev_photos" multiple="multiple" >
            </div>
            
            <button class="btn btn-primary d-block w-100 mb-4"  id="commit">수정</button>
            <button class="btn btn-primary d-block w-100 mb-4" type="reset"  id="commit">취소</button>
	</form>
</body>

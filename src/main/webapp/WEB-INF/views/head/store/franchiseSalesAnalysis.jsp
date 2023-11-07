<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<!-- jquery 데이터테이블 -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.6/js/jquery.dataTables.min.js"></script>

<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

		<!-- start page title -->
		<div class="col-sm-12 card widget-inline mt-3" style="height:110px;">
			<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">가맹점 매출분석</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">전체 가맹점의 매출을 조회합니다.</div>
					</div>
					<div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						매장관리 / &nbsp;<span class="text-decoration-underline">가맹점매출분석</span>
					</div>
				</div>
			</div>
            <!-- end page title -->

            <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="row mb-2">
		                        <div class="col-xl-12">
                                <form id="searchForm" method="post" class="row gy-2 gx-2 align-items-center justify-content-xl-end justify-content-between">
                                <input type="hidden" name="page" id="page"/>
                                    <!-- Predefined Date Ranges -->
                                    <div class="col-2">
                                            <input class="form-control" id="example-date" type="date" name="date">
                                    </div>
                                    <div class="col-auto">
                                        <span>~</span>
                                    </div>
                                    <div class="col-2">
                                            <input class="form-control" id="example-date" type="date" name="date">
                                    </div>
                                    <div class="col-2">
                                        <div class="d-flex align-items-center">
                                            <label for="status-select" class="col-3">분류</label>
                                            <select class="form-select" id="status-select" name="searchArea">
                                                <option value="">지역선택</option>
	                                                <option value="서울" <c:if test="${searchArea eq '서울특별시' }">selected</c:if>>서울특별시</option>
	                                                <option value="경기도" <c:if test="${searchArea eq '경기도' }">selected</c:if>>경기도</option>
	                                                <option value="전라북도" <c:if test="${searchArea eq '전라북도' }">selected</c:if>>전라북도</option>
	                                                <option value="전라남도" <c:if test="${searchArea eq '전라남도' }">selected</c:if>>전라남도</option>
	                                                <option value="경상북도" <c:if test="${searchArea eq '경상북도' }">selected</c:if>>경상북도</option>
	                                                <option value="경상남도" <c:if test="${searchArea eq '경상남도' }">selected</c:if>>경상남도</option>
	                                                <option value="충청북도" <c:if test="${searchArea eq '충청북도' }">selected</c:if>>충청북도</option>
	                                                <option value="충청남도" <c:if test="${searchArea eq '충청남도' }">selected</c:if>>충청남도</option>
	                                                <option value="부산" <c:if test="${searchArea eq '부산광역시' }">selected</c:if>>부산광역시</option>
	                                                <option value="대전" <c:if test="${searchArea eq '대전광역시' }">selected</c:if>>대전광역시</option>
	                                                <option value="대구" <c:if test="${searchArea eq '대구광역시' }">selected</c:if>>대구광역시</option>
	                                                <option value="인천" <c:if test="${searchArea eq '인천광역시' }">selected</c:if>>인천광역시</option>
	                                                <option value="광주" <c:if test="${searchArea eq '광주광역시' }">selected</c:if>>광주광역시</option>
	                                                <option value="울산" <c:if test="${searchArea eq '울산광역시' }">selected</c:if>>울산광역시</option>
	                                                <option value="강원도" <c:if test="${searchArea eq '강원도' }">selected</c:if>>강원도</option>
	                                                <option value="제주도" <c:if test="${searchArea eq '제주도' }">selected</c:if>>제주도</option>
	                                                <option value="세종" <c:if test="${searchArea eq '세종시' }">selected</c:if>>세종시</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label for="inputPassword2" class="visually-hidden">Search</label>
                                            <input type="search" class="form-control" name="searchFranchise" id="inputPassword2" placeholder="가맹점명 검색..">
                                            <button type="button" class="btn btn-secondary">검색</button>
                                        </div>
                                    </div>
                                    <sec:csrfInput/>
                                </form>                            
                            </div>
		                    </div>
		
		                    <div class="table-responsive">
		                    
		                        <table class="table table-centered table-nowrap mt-2">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="text-align:center; width:100px;">순번</th>
		                                    <th style="text-align:center; width:150px;">가맹점명</th>
		                                    <th style="text-align:center; width:150px;">가맹점주명</th>
		                                    <th style="text-align:center; width:150px;">운영상태</th>
		                                    <th style="text-align:center; width:150px;">주소</th>
		                                    <th style="text-align:center; width:150px;">연락처</th>
		                                    <th style="text-align:center; width:150px;">오픈일자</th>
		                                </tr>
		                            </thead>
		                            <c:set value="${pagingVO.dataList }" var="list"/>
		                            <c:choose>
		                            	<c:when test="${empty list }">
		                            		<tbody>
		                            			<tr>
		                            				<td colspan="7">조회하신 가맹점이 존재하지 않습니다.</td>
		                            			</tr>
		                            		</tbody>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<c:forEach items="${list }" var="list" varStatus="status">
					                            <tbody class="tbody">
					                                <tr>
					                                    <td style="text-align:center">
					                                    	${status.count }
					                                    </td>
					                                    <td class="frName" style="text-align:center" data-frcs-id="${list.frcsId }" data-frcs-name="${list.frcsName }">
					                                    	<span style="color: blue; cursor: pointer;">${list.frcsName }</span>
					                                    </td>
						                                <td style="text-align:center">
						                                   	${list.memName }
						                                </td>
						                                <td style="text-align:center">
						                                   	${list.frcsState }
						                                </td>
					                                    <td style="text-align:center">
					                                        ${list.frcsAdd1 }&nbsp;${list.frcsAdd2 }
					                                    </td>
					                                    <td style="text-align:center">
					                                    	${list.frcsTel }
					                                    </td>
					                                    <td style="text-align:center">
					                                    	${list.frcsOpdate }
					                                    </td>
					                                </tr>
					                            </tbody>
		                            		</c:forEach>
		                            	</c:otherwise>
		                            </c:choose>
		                        </table>
		                    </div>
                        </div>
		                    <br>
								<nav aria-label="Page navigation example" id="pagingArea">
									${pagingVO.pagingHTML }
								</nav>
		                </div> <!-- end card-body-->
		            </div> <!-- end card-->
		        </div> <!-- end col -->
		    </div>

            <div class="row">
                <div class="col-lg-6">
                        <div class="card">
                             <div class="card-header d-flex justify-content-center align-items-center">
                             <i class="me-3 ri-arrow-left-s-line" id="leftMonth" style="font-size: 30px; cursor: pointer;"></i>
                                <h1 class="header-title font-24"><span id="spYear"></span>년 <span id="spMonth"></span>월 손익계산서</h1>
                             <i class="ms-3 ri-arrow-right-s-line" id="rightMonth" style="font-size: 30px; cursor: pointer;"></i>
                            </div>

                        <div class="card-body" style="height:600px;">
                             <div class="col-lg-12 d-flex justify-content-between">
                                    <div class="col-lg-10">
                                        <table class="table table-bordered table-centered ms-5">
                                            <thead class="table-dark" style="text-align: center;">
                                                <tr>
                                                    <th style="width: 500px;">과목</th>
                                                    <th style="width: 500px;">금액(원)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td style="text-align: center;">Ⅰ.총매출액</td>
                                                    <td id="totalPrice" style="text-align: center;">(가맹점 총 매출액)</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">Ⅱ. 판매비와관리비</td>
                                                    <td id="variableCost" style="text-align: center;">(로얄티 + 인건비)<br>공과금(수도세+전기세+가스비)</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">가맹비</td>
                                                    <td id="frcsCost" style="text-align: center;">500000</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">로얄티</td>
                                                    <td id="frcsRowal" style="text-align: center;">총매출액 * 0.03</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">인건비</td>
                                                    <td id="personCost" style="text-align: center;">5200000</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">공과금</td>
                                                    <td id="publicduesTotal" style="text-align: center;">(수도세/전기세/가스비) + (월세)</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">Ⅲ. 매출원가</td>
                                                    <td id="originPrice" style="text-align: center;">총매출액 - 매입가</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">매입가</td>
                                                    <td id="purchasePrice" style="text-align: center;">본사발주금액</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">Ⅳ. 영업이익</td>
                                                    <td id="profitPrice" style="text-align: center;">매출원가 - 판매비와관리비</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">Ⅴ. 당기순이익</td>
                                                    <td id="incomePrice" style="text-align: center;">영업이익 - 세금(10%)</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div> 
                        </div>
                        </div> <!-- end card -->
                    </div><!-- end col-->

                    <div class="col-lg-6">
                        <div class="card">
                            <div style="height:30px;"class="card-header d-flex justify-content-between align-items-center mt-2">
                                <h1 class="header-title font-24 mt-2"> <span id="selectFrcsName"></span>&nbsp;영업매출</h1>
                            </div>
                            <div class="card-body">
<!--                                 <h4 class="header-title mb-4">Spline Area</h4> -->
                                <div class="row" style="height:50px;">
			                		<div class="col-4" id="test"></div>
				               			<div class="col mt-4 mb-4 d-flex justify-content-center align-items-center">
				                 				<div id="calYear" class="" style="font-size: 30px; font-family: 'GmarketSansMedium';"></div>
				               			</div>
				                 	<div class="col-4"></div>
			                	</div>
									<div class="card-body">
                                        <div class="chart-body" dir="ltr">
                                            <div>
                                                <canvas id="mixed-chart" width="800" height="450"></canvas>
                                            </div>
                                        </div>

                                    </div> <!-- end card body-->
                            </div>
                            <!-- end card body-->
                        </div> <!-- end card -->
                    </div><!-- end col-->
                    
                </div>
                <!-- end row-->

        <!-- Footer Start -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <script>document.write(new Date().getFullYear())</script> © Hyper - Coderthemes.com
                    </div>
                    <div class="col-md-6">
                        <div class="text-md-end footer-links d-none d-md-block">
                            <a href="javascript: void(0);">About</a>
                            <a href="javascript: void(0);">Support</a>
                            <a href="javascript: void(0);">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->


        </div>
        <!-- End Container-fluid-->
	</div>
	<!-- content -->
</div>
<!-- content-page -->

<script type="text/javascript">

function formatWon(number) {
    // 숫자를 한국 표준 통화 형식으로 포맷팅
    var formattedNumber = new Intl.NumberFormat('ko-KR', {
      style: 'currency',
      currency: 'KRW'
    }).format(number);
    
    // "₩" 통화 기호 제거
    formattedNumber = formattedNumber.replace("₩", "");
    
    // "(원)" 추가
    return formattedNumber + "(원)";
}
var dataObject = {};

var sales = [];
var profit = [];

// 차트헤더에 띄워줄 가맹점명
var selectFrcsName = $("#selectFrcsName");

var searchForm = $("#searchForm");
var pagingArea = $("#pagingArea");

var date = new Date();
var month = date.getMonth() + 1;
var day = date.getDate();
var year = date.getFullYear();

var curMonth = (month - 1);

$("#spYear").html(year);
$("#spMonth").html(curMonth);
$("#calYear").html(year);

$("#leftMonth").on("mouseover", function(){
	$("#leftMonth").css("transform", "scale(1.5)")
});

$("#leftMonth").on("mouseout", function(){
	$("#leftMonth").css("transform", "")
});

$("#rightMonth").on("mouseover", function(){
	$("#rightMonth").css("transform", "scale(1.5)")
});

$("#rightMonth").on("mouseout", function(){
	$("#rightMonth").css("transform", "")
});

// 가맹점명을 클릭 시 데이터를 불러옴
$(".tbody").on("click", ".frName", function(){
	
	dataObject = {};
	
	var frcsId = $(this).data("frcsId");
	var frcsName = $(this).data("frcsName");

	var strYear = $("#spYear").text();
	var curYear = parseInt(strYear);
	
	console.log(frcsId);
	console.log(frcsName);
	console.log(strYear);
	console.log(curYear);
	console.log(year);
	console.log("curMonth -> " + curMonth);
	
	// 새로운 가맹점명을 클릭했을 때 현재연/월로 돌아오기위해
	var curMonth = 10; 
    var year = 2023; 
	
	$("#spYear").html(year);
	$("#spMonth").html(curMonth);
	$("#calYear").html(year);
	
	selectFrcsName.html(frcsName);
	
	dataObject = {
			frcsId 	 : frcsId,
			frcsName : frcsName,
			curMonth : curMonth,
			year  	 : year
	}
	
	$.ajax({
		type : "post",
		url : "/head/selectChartData.do",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		data : JSON.stringify(dataObject),
		contentType : "application/json; charset=utf-8",
		success : function(res){
			console.log("여기까지왔나");
			console.log(res);
			
			$("#totalPrice").html(formatWon(res.totalPrice));
			$("#variableCost").html(formatWon(res.variableCost));
			$("#frcsCost").html(formatWon(res.frcsCost));
			$("#frcsRowal").html(formatWon(res.frcsRowal));
			$("#personCost").html(formatWon(res.personCost));
			$("#publicduesTotal").html(formatWon(res.publicduesTotal));
			$("#originPrice").html(formatWon(res.originPrice));
			$("#purchasePrice").html(formatWon(res.purchasePrice));
			$("#profitPrice").html(formatWon(res.profitPrice));
			$("#incomePrice").html(formatWon(res.incomePrice));
			
			$.ajax({
				type : "post",
				url : "/head/selectChartSales.do",
				beforeSend : function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				data : JSON.stringify(dataObject),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					console.log("여기까지왔나");
					
					sales = []; // 배열 초기화
					sales.push(res.january);
					sales.push(res.february);
					sales.push(res.march);
					sales.push(res.april);
					sales.push(res.may);
					sales.push(res.june);
					sales.push(res.july);
					sales.push(res.august);
					sales.push(res.september);
					sales.push(res.october);
					sales.push(res.november);
					sales.push(res.december);
					
					console.log("1~12월 값이 잘들어왔나?",sales);
					
					profit = []; // 배열 초기화
					profit.push(res.oneIncome);
					profit.push(res.twoIncome);
					profit.push(res.threeIncome);
					profit.push(res.fourIncome);
					profit.push(res.fiveIncome);
					profit.push(res.sixIncome);
					profit.push(res.sevenIncome);
					profit.push(res.eightIncome);
					profit.push(res.nineIncome);
					profit.push(res.tenIncome);
					profit.push(res.elevenIncome);
					profit.push(res.twelveIncome);
					
					console.log("당기순이익",profit);
					chartSetting(sales,profit);
					
				}
			});
			
		}
	});
	
});

// 1개월 단위로 감소
$("#leftMonth").on("click", function(){
	var currentYear = parseInt($("#spYear").text());
	var currentMonth = parseInt($("#spMonth").text());
	
	// 이전 월 계산
	var previousYear = currentYear; 
	var previousMonth = currentMonth - 1;
	
	if(previousMonth < 1){
		previousYear--;
		previousMonth = 12;	// 1월 전은 12월
		// 연도가 변경될 때 이벤트를 발생시키는 로직 추가
		dataObject.curMonth = previousMonth;
		dataObject.year = previousYear;
	    yearChange(previousYear);
	}
	
	$("#spYear").html(previousYear);
	$("#spMonth").html(previousMonth);
	
	dataObject.year = previousYear;
	dataObject.curMonth = previousMonth;
	
	 
	
	console.log("현재 연월 -> " + previousYear + "-" + previousMonth);
	
	$.ajax({
		type : "post",
		url : "/head/selectChartData.do",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		data : JSON.stringify(dataObject),
		contentType : "application/json; charset=utf-8",
		success : function(res){
			console.log("여기까지왔나");
			console.log(res);
			
			$("#totalPrice").html(formatWon(res.totalPrice));
			$("#variableCost").html(formatWon(res.variableCost));
			$("#frcsCost").html(formatWon(res.frcsCost));
			$("#frcsRowal").html(formatWon(res.frcsRowal));
			$("#personCost").html(formatWon(res.personCost));
			$("#publicduesTotal").html(formatWon(res.publicduesTotal));
			$("#originPrice").html(formatWon(res.originPrice));
			$("#purchasePrice").html(formatWon(res.purchasePrice));
			$("#profitPrice").html(formatWon(res.profitPrice));
			$("#incomePrice").html(formatWon(res.incomePrice));
			
		}
	});
});

// 1개월 단위로 증가
$("#rightMonth").on("click", function(){
	var currentYear = parseInt($("#spYear").text());
	var currentMonth = parseInt($("#spMonth").text());
	
	// 이전 월 계산
	var nextYear = currentYear; 
	var nextMonth = currentMonth + 1;
	
	if(nextMonth > 12){
		nextYear++;
		nextMonth = 1;	// 12월 다음은 1월
		dataObject.curMonth = nextMonth; // 기존curMonth를 변경된 month로 세팅
		dataObject.year = nextYear; // 기존curYear를 변경된 year로 세팅
	    yearChange(nextYear);
	}
	
	$("#spYear").html(nextYear);
	$("#spMonth").html(nextMonth);
	
	dataObject.year = nextYear;
	dataObject.curMonth = nextMonth;
	
	console.log("현재 연월 -> " + nextYear + "-" + nextMonth);
	
	$.ajax({
		type : "post",
		url : "/head/selectChartData.do",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		data : JSON.stringify(dataObject),
		contentType : "application/json; charset=utf-8",
		success : function(res){
			console.log("여기까지왔나");
			console.log(res);
			
			$("#totalPrice").html(formatWon(res.totalPrice));
			$("#variableCost").html(formatWon(res.variableCost));
			$("#frcsCost").html(formatWon(res.frcsCost));
			$("#frcsRowal").html(formatWon(res.frcsRowal));
			$("#personCost").html(formatWon(res.personCost));
			$("#publicduesTotal").html(formatWon(res.publicduesTotal));
			$("#originPrice").html(formatWon(res.originPrice));
			$("#purchasePrice").html(formatWon(res.purchasePrice));
			$("#profitPrice").html(formatWon(res.profitPrice));
			$("#incomePrice").html(formatWon(res.incomePrice));
			
		}
	});
	
});

function yearChange(year) {
    // 연도가 변경될 때 발생시키고 싶은 이벤트 처리 로직을 여기에 추가
    console.log("연도 변경됨:", year);
    
    $("#calYear").html(year);
    
    console.log("연도 변경될때 들어있는 dataObject확인", dataObject);
    
    $.ajax({
		type : "post",
		url : "/head/selectChartData.do",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		data : JSON.stringify(dataObject),
		contentType : "application/json; charset=utf-8",
		success : function(res){
			console.log("여기까지왔나");
			console.log(res);
			
			$("#totalPrice").html(formatWon(res.totalPrice));
			$("#variableCost").html(formatWon(res.variableCost));
			$("#frcsCost").html(formatWon(res.frcsCost));
			$("#frcsRowal").html(formatWon(res.frcsRowal));
			$("#personCost").html(formatWon(res.personCost));
			$("#publicduesTotal").html(formatWon(res.publicduesTotal));
			$("#originPrice").html(formatWon(res.originPrice));
			$("#purchasePrice").html(formatWon(res.purchasePrice));
			$("#profitPrice").html(formatWon(res.profitPrice));
			$("#incomePrice").html(formatWon(res.incomePrice));
			
			$.ajax({
				type : "post",
				url : "/head/selectChartSales.do",
				beforeSend : function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				data : JSON.stringify(dataObject),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					console.log("여기까지왔나");
					
					sales = []; // 배열 초기화
					sales.push(res.january);
					sales.push(res.february);
					sales.push(res.march);
					sales.push(res.april);
					sales.push(res.may);
					sales.push(res.june);
					sales.push(res.july);
					sales.push(res.august);
					sales.push(res.september);
					sales.push(res.october);
					sales.push(res.november);
					sales.push(res.december);
					
					console.log("1~12월 값이 잘들어왔나?",sales);
					
					profit = []; // 배열 초기화
					profit.push(res.oneIncome);
					profit.push(res.twoIncome);
					profit.push(res.threeIncome);
					profit.push(res.fourIncome);
					profit.push(res.fiveIncome);
					profit.push(res.sixIncome);
					profit.push(res.sevenIncome);
					profit.push(res.eightIncome);
					profit.push(res.nineIncome);
					profit.push(res.tenIncome);
					profit.push(res.elevenIncome);
					profit.push(res.twelveIncome);
					
					console.log("당기순이익",profit);
					chartSetting(sales,profit);
					
				}
			});
			
		}
	});
}

//a 태그를 클릭하면 이벤트 실행
pagingArea.on("click","a", function(event){
	event.preventDefault();
	var pageNo = $(this).data("page");
	searchForm.find("#page").val(pageNo);
	searchForm.submit();
});

function chartSetting(sales,profit){
	removeChart();
	var canvas = $("<div><canvas id='mixed-chart' width='800' height='450'></canvas></div>");
	
	var chart = $(".chart-body");
	chart.append(canvas);
	
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	
	var days = new Date(year, month, 0).getDate();

	const ctx = document.getElementById('mixed-chart');
	
	var labels = getLabel(sales);
	
	new Chart(ctx, {
	    type: 'bar',
	    data: {
	      labels: labels,
	      datasets: [ {
	          label: "총매출",
	          type: "bar",
	          backgroundColor: "rgba(0,143,226,0.2)",
	          backgroundColorHover: "#96FFFF",
	          data: sales
	        },{
	          label: "# 당기순이익",
	          type: "line",
	          borderColor: "#FFA8A5",
	          backgroundColor: "#FFA8A5", // 배경색을 핑크로 지정
	          data: profit,
	          fill: false
		     }
	      ]
	    },
	    options: {
	      title: {
	        display: true,
	        text: '연도별 총매출 집계'
	      },
	      legend: { display: false },
	    }
	    
	});
}



function getLabel(sales){
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();

	var days = new Date(year, month, 0).getDate();
	
	var labels = [];
	
	for(var i = 1; i <=sales.length; i++){
		labels.push(i + "월");
	}
	
	return labels;
}

function removeChart(){
	var oldCanvas = $("#mixed-chart");
	if(oldCanvas){
		oldCanvas.remove();
	}
}

</script>
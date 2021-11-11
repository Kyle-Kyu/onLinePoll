<%@page import="com.koreait.onLinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title~~~~~~~~~</title>
<!-- 
	fabicon: title 앞에 표시되는 사이트를 대표하는 작은 이미지를 의미한다. -->
<link rel="icon" href="./favicon.ico">
</head>
<body>

<!-- 투표 항목이 저장된 텍스트 파일의 데이터를 읽어서 웹 브라우저에 출력한다. -->
<%
//	프로젝트를 실행하면 이클립스가 자체적으로 웹 서버를 구축하고 구축된 웹 서버에서 웹 서비스를 실행한다. => 실제 경로, realPath	
//	이클립스에서 웹 서비스가 구현되는 실제 경로
//	D:\jsp\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\0817_onLinePoll
//	application.getRealPath("/") 명령을 실행해서 이클립스에서 웹 서비스가 구현되는 실제 경로를 얻어올 수 있다.
//	out.println(application.getRealPath("/"));		// "/"는 웹 서비스가 실행되는 web root(최상위 경로)를 의미한다.
	String filepath = application.getRealPath("/") + "poll.txt";
//	out.println(filepath);
	
//	텍스트 파일의 데이터를 읽어오는 메소드를 실행해서 리턴되는 결과를 ArrayList에 저장한다.	
	ArrayList<String> poll = PollRead.pollRead(filepath);
//	out.println(poll);
//	for (String str : poll) {
//		out.println(str + "<br>");
//	}

// 	투표 항목의 개수를 계산한다.
	int itemCount = (poll.size() - 1) / 2;
//	out.println(itemCount);

%>

<form action="pollWrite.jsp" method="post">

	<!-- cellpadding: 셀과 셀 내부에 입력된 데이터와의 간격을 지정한다. => 안여백
		 cellspacing: 셀과 셀 사이의 간격을 지정한다. => 셀간격 -->
	<table width="500" border="1" align="center" cellpadding="5" cellspacing="0">
	
		<tr height="50">
		<!-- 표 만들기 첫줄은 th 나머지 줄은 td -->
			<th>
			<!--  
				<%
					out.println(poll.get(0));
				%>
				-->			
				<%=poll.get(0)%>
			</th>
		
		</tr>
		
		<!-- 투표 항목의 개수만큼 반복하며 라디오 버튼과 투표 항목을 출력한다. -->
		<%
			for (int i = 1; i <= itemCount; i++) {
		%>
			<tr height="50">
				<td>		
					<input type="radio" name="poll" value=<%=i%>><%=poll.get(i)%>
					
				</td>
		
			</tr>
		<%
			}	
		%>
		
			<tr height="50">
				<td align="center">
					<input type="submit" value="투표하기">
					<input type="button" value="결과보기" onclick="location.href='pollResult.jsp'">
				</td>
			</tr>
		
	</table>
</form>

</body>
</html>














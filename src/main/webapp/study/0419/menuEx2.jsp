<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>menuEx2.jsp</title>
    <style>
    	ul, li {
            margin: 0px;
            padding: 0px;
            list-style: none;
        }
        a {
            /* color : blue;
            text-decoration: none; */
            color: inherit;         /*부모가 따로 없으면 윈도우를 따라간다.*/
            text-decoration: inherit;
        }
        .menu {
            text-align: center;
        }
        .menu ul {      /*주메뉴와 서브메뉴 모두 적용*/
            background-color: burlywood;
        }
        .menu > ul {
            /* background-color: #dfdfdf; */
            display: inline-block;
            padding: 0px 10px;
            border-radius: 5px;
        }
        .menu > ul > li {
            display: inline-block;
            width: 200px;
        }
        /* .menu > ul > li > a { */
        .menu li > a {
            /* background-color: red; */
            display: block;
            padding: 10px;
        }
        /* .menu > ul > li:hover > a { */
        .menu li:hover > a {
            background-color: #000; 
            color: white;
        }
        .menu li {
            position: relative;
        }
        /* 서브메뉴 */
        .menu ul ul {
            display: none;
            position: absolute;
            /* top : 100%; */s
            left: 0px;
            width: 200px;
        }
        .menu li:hover > ul {
            display: block;
        }
    </style>
</head>
<body>
	<h2 align="center">JISU's Books </h2>
	 <nav class="menu">
        <ul>
            <li>
                <a href="main2.jsp">홈으로</a>
            </li>
            <li>
                <a href="#">한국 서적</a>
                <ul>
                    <li><a href="main2.jsp?flag=kor5">별점 5점</a></li>
                    <li><a href="main2.jsp?flag=kor4">별점 4점</a></li>
                    <li><a href="main2.jsp?flag=kor3">별점 3점</a></li>
                </ul>
            </li>
            <li>
                <a href="#">외국 서적</a>
                <ul>
                    <li><a href="main2.jsp?flag=for5">별점 5점</a></li>
                    <li><a href="main2.jsp?flag=for4">별점 4점</a></li>
                    <li><a href="main2.jsp?flag=for3">별점 3점</a></li>
                </ul>
            </li>
            <li>
                <a href="#">사용자 메뉴</a>
                <ul>
                    <li><a href="main2.jsp?flag=guest2">방명록</a></li>
                    <li><a href="main2.jsp?flag=board2">게시판</a></li>
                    <li><a href="main2.jsp?flag=photo2">포토갤러리</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</body>
</html>
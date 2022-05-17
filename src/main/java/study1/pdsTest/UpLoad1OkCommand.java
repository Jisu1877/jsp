package study1.pdsTest;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study1.StudyInterface;

public class UpLoad1OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// MultipartRequest(저장소이름(request), "서버에 저장될 파일의 경로", "최대용량", "코드변환방식", 기타옵션(중복방지클래스))
		// 파일업로드 서버에 저잘될 실제경로명 알아내기? getRealPath() : application객체를 이용하여 사용할 수 있다.
		
		ServletContext application = request.getServletContext(); //어플리케이션 객체 사용을 위해 불러오기
		// 경로알아내서 realPath 변수에 담기
		String realPath = application.getRealPath("/data/pdsTest");     // '/'와 '\\'는 같은 의미. root. => webapp
		int maxSize = 1024 * 1024 * 10; //최대용량을 10MByte로 사용하고자 한다.
		String encoding = "UTF-8";
		
		//System.out.println("realPath : " + realPath);
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy()); //객체 생성시 업로드 완료됨...
	
		// 업로드 시킬 때의 업로드 파일명
		String fName = request.getParameter("fName"); // 외부라이브러리를 사용하게 되면 request객체로 from태그안에 값을 불러올 수 없다.
		String originalFileName = multipartRequest.getOriginalFileName("fName"); //form태그의 name 
		// 실제로 서버에 저장되는 파일명
		String filesystemName = multipartRequest.getFilesystemName("fName"); //form태그의 name
		
		System.out.println("원본 파일명1 : " + fName);
		System.out.println("원본 파일명2 : " + originalFileName);
		System.out.println("파일이 저장되는 실제 경로명 : " + realPath);
		System.out.println("서버에 저장되는 실제 파일명 : " + filesystemName);
		
		if(filesystemName == null) {
			request.setAttribute("msg", "upLoad1No");
		}
		else {
			request.setAttribute("msg", "upLoad1Ok");
		}
		request.setAttribute("url", request.getContextPath() +"/upLoad1.st");
		
	}

}

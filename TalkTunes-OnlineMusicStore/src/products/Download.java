package products;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.FileInputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Download")

public class Download extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Download() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String song_name = request.getParameter("DownloadName");
		System.out.println("Download Song Name : " + song_name + ".mp3");
		
		PrintWriter out = response.getWriter();
		String filename = song_name + ".mp3";

		String filepath = "C:\\Users\\Dilshan Ramesh\\Documents\\EclipseProjects\\TalkTunes-OnlineMusicStore\\WebContent\\song\\";
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
 
		FileInputStream fileInputStream = new FileInputStream(filepath + filename);
 
		int i;
		while ((i = fileInputStream.read()) != -1) {
			out.write(i);
		}
		
		fileInputStream.close();
		out.close();	
	}

}

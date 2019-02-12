package email;

public class Main {

	public static void main(String[] args) {
		
		sendMail m1 = new sendMail();
		
		m1.setSubject("Java Project");
		m1.setContent("Sample Content project");
		m1.setReceiver("dilshanramesh81@gmail.com");
		m1.getSubject();
		m1.getContent();
		m1.getReceiver();
	
		
		m1.send_email();

	}

}

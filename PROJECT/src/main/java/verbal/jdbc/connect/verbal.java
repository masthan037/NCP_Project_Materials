package verbal.jdbc.connect;

public class verbal {
	private int verbID;
	private String mcqQ;
	private String A;
	private String B;
	private String C;
	private String D;
	private String ans;
	
	public verbal(int verbID, String mcqQ, String a, String b, String c, String d, String ans) {
		super();
		this.verbID = verbID;
		this.mcqQ = mcqQ;
		A = a;
		B = b;
		C = c;
		D = d;
		this.ans = ans;
	}

	public int getVerbID() {
		return verbID;
	}

	public void setVerbID(int verbID) {
		this.verbID = verbID;
	}

	public String getMcqQ() {
		return mcqQ;
	}

	public void setMcqQ(String mcqQ) {
		this.mcqQ = mcqQ;
	}

	public String getA() {
		return A;
	}

	public void setA(String a) {
		A = a;
	}

	public String getB() {
		return B;
	}

	public void setB(String b) {
		B = b;
	}

	public String getC() {
		return C;
	}

	public void setC(String c) {
		C = c;
	}

	public String getD() {
		return D;
	}

	public void setD(String d) {
		D = d;
	}

	public String getAns() {
		return ans;
	}

	public void setAns(String ans) {
		this.ans = ans;
	}

	@Override
	public String toString() {
		return "verbal [verbID=" + verbID + ", mcqQ=" + mcqQ + ", A=" + A + ", B=" + B + ", C=" + C + ", D=" + D
				+ ", ans=" + ans + "]";
	}
	
	
}

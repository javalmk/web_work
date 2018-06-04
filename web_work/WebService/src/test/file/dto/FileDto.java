package test.file.dto;

public class FileDto {

private int num;
private String writer;
private String title;
private String orgFilename;//원래 파일명
private String saveFilename;//저장된 파일명
private long filesize;//파일의 크기 byte는 큰 숫자 있을 수 있으므로
private String regdate;

public FileDto() {
	// TODO Auto-generated constructor stub
}

public FileDto(int num, String writer, String title, String orgFilename, String saveFilename, long filesize,
		String regdate) {
	super();
	this.num = num;
	this.writer = writer;
	this.title = title;
	this.orgFilename = orgFilename;
	this.saveFilename = saveFilename;
	this.filesize = filesize;
	this.regdate = regdate;
}

public int getNum() {
	return num;
}

public void setNum(int num) {
	this.num = num;
}

public String getWriter() {
	return writer;
}

public void setWriter(String writer) {
	this.writer = writer;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getOrgFilename() {
	return orgFilename;
}

public void setOrgFilename(String orgFilename) {
	this.orgFilename = orgFilename;
}

public String getSaveFilename() {
	return saveFilename;
}

public void setSaveFilename(String saveFilename) {
	this.saveFilename = saveFilename;
}

public long getFilesize() {
	return filesize;
}

public void setFilesize(long filesize) {
	this.filesize = filesize;
}

public String getRegdate() {
	return regdate;
}

public void setRegdate(String regdate) {
	this.regdate = regdate;
}


}

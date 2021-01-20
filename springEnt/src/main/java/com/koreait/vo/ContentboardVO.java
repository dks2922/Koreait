package com.koreait.vo;

public class ContentboardVO {

	private int idx;
	private String name;
	private String genre;
	private String company;
	private String cls;
	private int price;
	private String releaseDate;
	private String url;
	private String photo;
	private String subject;
	private String platform;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCls() {
		return cls;
	}
	public void setCls(String cls) {
		this.cls = cls;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	@Override
	public String toString() {
		return "ContentboardVO [idx=" + idx + ", name=" + name + ", genre=" + genre + ", company=" + company + ", cls="
				+ cls + ", price=" + price + ", releaseDate=" + releaseDate + ", url=" + url + ", photo=" + photo
				+ ", subject=" + subject + ", platform=" + platform + "]";
	}
	
	
	
}

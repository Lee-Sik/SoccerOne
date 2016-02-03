package sist.co.help;

import java.io.Serializable;

import base.util.StringUtil;

public class PagingBean implements Serializable {

	int totalRecordCount=1;//
	int pageNumber=1		;//	= StringUtil.stringToInt(request.getParameter("pageNumber"));
	int pageCountPerScreen=10	;//= StringUtil.stringToInt(request.getParameter("pageCountPerScreen"));
	int recordCountPerPage=10;//	= StringUtil.stringToInt(request.getParameter("recordCountPerPage"));
	
	int totalPageCount ;
	int screenStartPageIndex;// = ((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen;
	int screenEndPageIndex ;//= (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;
	public int getTotalRecordCount() {
		return totalRecordCount;
	}
	public void setTotalRecordCount(int totalRecordCount) {
		//this.totalRecordCount = StringUtil.stringToInt(totalRecordCount, 0);
		this.totalRecordCount=totalRecordCount;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber=pageNumber;
		//this.pageNumber=StringUtil.stringToInt(pageNumber, 0);
	}
	public int getPageCountPerScreen() {
		return pageCountPerScreen;
	}
	public void setPageCountPerScreen(int pageCountPerScreen) {
		this.pageCountPerScreen =  pageCountPerScreen;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int  recordCountPerPage) {
		//this.recordCountPerPage = StringUtil.stringToInt(recordCountPerPage);
		this.recordCountPerPage=recordCountPerPage;
	}
	public int getTotalPageCount() {
//		totalPageCount = totalRecordCount / recordCountPerPage;
		totalPageCount = (int)(Math.ceil(1.0*totalRecordCount / recordCountPerPage));
//		if ((totalRecordCount % recordCountPerPage) != 0) {
//			totalPageCount++;
//		}
		return totalPageCount;
	}
//	public void setTotalPageCount(int totalPageCount) {
//		this.totalPageCount = totalPageCount;
//	}
	public int getScreenStartPageIndex() {
		screenStartPageIndex = ((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen;
		if (((pageNumber+1) % pageCountPerScreen) == 0)
		{
		    screenStartPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) - pageCountPerScreen;
		}
		return screenStartPageIndex;
	}
//	public void setScreenStartPageIndex(int screenStartPageIndex) {
//		this.screenStartPageIndex = screenStartPageIndex;
//	}
	public int getScreenEndPageIndex() {
		screenEndPageIndex =(((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;
		if (screenEndPageIndex > totalPageCount) screenEndPageIndex = totalPageCount;
		if (((pageNumber+1) % pageCountPerScreen) == 0)
		{
		    screenEndPageIndex = pageNumber+1;
		}
		return screenEndPageIndex;
	}
//	public void setScreenEndPageIndex(int screenEndPageIndex) {
//		this.screenEndPageIndex = screenEndPageIndex;
//	}

}

package egovframework.com.cmm;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;
/**
 * ImagePaginationRenderer.java 클래스
 * 
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2011. 9. 16.   서준식       이미지 경로에 ContextPath추가
 * </pre>
 */
public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;
	
	public ImagePaginationRenderer() {
	
	}
	
	public void initVariables(){
		firstPageLabel    = "<a href=\"{0}&amp;pageIndex={1}\" class=\"first\" title=\"처음페이지로 이동\"><span> 처음 </span></a>";
        previousPageLabel = "<a href=\"{0}&amp;pageIndex={1}\" class=\"prev\" title=\"이전페이지로 이동\"><span> 이전 </span></a>";
        currentPageLabel  = "<strong class=\"current\"> {0} </strong>";
        otherPageLabel    = "<a href=\"{0}&amp;pageIndex={1}\" class=\"page\" title=\"{1}페이지로 이동\"> {1} </a>";
        nextPageLabel     = "<a href=\"{0}&amp;pageIndex={1}\" class=\"next\" title=\"다음페이지로 이동\"><span> 다음 </span></a>";
        lastPageLabel     = "<a href=\"{0}&amp;pageIndex={1}\" class=\"last\" title=\"마지막페이지로 이동\"><span> 마지막 </span></a>";
	}
	

	

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}

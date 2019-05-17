package Controllers;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class sessionListener
 *
 */
public class sessionListener implements HttpSessionListener {
	int count=0;
    /**
     * Default constructor. 
     */
    public sessionListener() {
        // TODO Auto-generated constructor stub
    }
	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    	count++;
    	ServletContext appContext = 
    			se.getSession().getServletContext();
    	appContext.setAttribute("sessioncount", count);
    }
	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    	count--;
    	ServletContext appContext = 
    			se.getSession().getServletContext();
    	appContext.setAttribute("sessioncount", count);
    }
}

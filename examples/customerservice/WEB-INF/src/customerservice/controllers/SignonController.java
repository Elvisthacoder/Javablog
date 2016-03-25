package customerservice.controllers;

import static com.scooterframework.web.controller.ActionControl.*;

import com.scooterframework.admin.FilterManagerFactory;
import com.scooterframework.orm.activerecord.ActiveRecord;
import com.scooterframework.web.controller.ActionResult;
import com.scooterframework.security.LoginHelper;


/**
 * SignonController class handles signon related access.
 */
public class SignonController extends ApplicationController {

    static {
        filterManagerFor(SignonController.class).declareBeforeFilter("loginRequired", "only", "main");
        filterManagerFor(SignonController.class).declareBeforeFilter("validateInput", "only", "authenticate");
    }
    
    public String validateInput() {
        validators().validatesPresenceOf("username");
        validators().validatesPresenceOf("password");
        if (validationFailed()) {
            flash("error", "Please submit both username and password.");
            return redirectTo("/signon/login");
        }
        return null;
    }
    
    /**
     * main method
     */
    public String main() {
        return null;
    }
    
    /**
     * login method
     */
    public String login() {
        return null;
    }
    
    /**
     * Authenticates login request.
     */
    public String authenticate() {
        String username = p("username");
        String password = p("password");

        /************* Remove this block ************/
            LoginHelper.cacheLoggedInUserId(username);//Save the login user id to session
            return redirectTo("/signon/main");
        

        /************* Implement authentication logic below ***********
        ActiveRecord user = Account.findFirst("username=" + username + ", password=" + password);
        if (user != null) {
            LoginHelper.cacheLoggedInUser(user);//Save the login user to session
            LoginHelper.cacheLoggedInUserId(username);//Save the login user id to session
            return redirectTo("/signon/main");
        }
        
        flash("error", "Please login by using correct username and password.");
        return forwardTo("/signon/login");
        ************** Implement the above block ************/
    }

    /**
     * logout method
     */
    public String logout() {
        LoginHelper.userLogout();
        return null;
    }

    /**
     * loginRequired method (usually used in beforeFilter)
     */
    public String loginRequired() {
        if (!LoginHelper.isLoggedIn()) {
            flash("error", "You must be logged in to do that.");
            return redirectTo("/signon/login");
        }
        return null;
    }
}

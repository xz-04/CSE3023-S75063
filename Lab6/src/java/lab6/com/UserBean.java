package lab6.com;

import java.io.Serializable;

/**
 * JavaBean for User Profile registration and login
 */
public class UserBean implements Serializable {

    // Instance variables matching the database attributes
    private String username;
    private String password;
    private String firstname;
    private String lastname;

    // 1. Public no-argument constructor (Required for <jsp:useBean>)
    public UserBean() {
    }

    // 2. Getter and Setter for Username
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    // 3. Getter and Setter for Password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // 4. Getter and Setter for Firstname
    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    // 5. Getter and Setter for Lastname
    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
}

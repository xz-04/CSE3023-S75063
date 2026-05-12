package lab6.com;

import java.io.Serializable;
import java.util.regex.*;

public class Marathon implements Serializable {

    private String icNo;
    private String name;
    private String category;
    private String valid;
    private String invalid = "Invalid IC Format";

    public Marathon() {
    }

    public String getIcNo() {
        // Pattern for ######-##-####
        Pattern pt = Pattern.compile("^[0-9]{6}-[0-9]{2}-[0-9]{4}$");
        Matcher mt = pt.matcher(icNo);

        if (mt.matches()) {
            valid = icNo;
        } else {
            valid = invalid;
        }
        return valid;
    }

    public void setIcNo(String icNo) {
        this.icNo = icNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}

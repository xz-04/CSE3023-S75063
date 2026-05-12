package lab6.com;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Book {

    private String stuno;
    private String name;
    private String program;
    private String valid = "";
    private String invalid = "Invalid Format";

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }

    public String getStuno() {
        Pattern pt = Pattern.compile("[A-Z0-9]+");
        Matcher mt = pt.matcher(stuno);
        boolean b1 = mt.matches();
        if (b1 == true) {
            valid = stuno;
        } else {
            valid = invalid;
        }
        return valid;
    }

    public void setStuno(String stuno) {
        this.stuno = stuno;
    }
}

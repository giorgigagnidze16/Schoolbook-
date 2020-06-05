package Model.User;

import java.io.Serializable;

public class User implements Serializable {
    private int User_ID;
    private String First_Name;
    private String Last_Name;
    private int ID_Number;
    private String Password;
    private String Class_Name;
    private int User_Type_ID;
   private String subject;

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getClass_Name() {
        return Class_Name;
    }

    public void setClass_Name(String class_Name) {
        Class_Name = class_Name;
    }



    public int getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(int user_ID) {
        User_ID = user_ID;
    }

    public String getFirst_Name() {
        return First_Name;
    }

    public void setFirst_Name(String first_Name) {
        First_Name = first_Name;
    }

    public String getLast_Name() {
        return Last_Name;
    }

    public void setLast_Name(String last_Name) {
        Last_Name = last_Name;
    }

    public int getID_Number() {
        return ID_Number;
    }

    public void setID_Number(int ID_Number) {
        this.ID_Number = ID_Number;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }





    public int getUser_Type_ID() {
        return User_Type_ID;
    }

    public void setUser_Type_ID(int user_Type_ID) {
        User_Type_ID = user_Type_ID;
    }

    @Override
    public String toString() {
        return "Model.User.User{" +
                "User_ID=" + User_ID +
                ", First_Name='" + First_Name + '\'' +
                ", Last_Name='" + Last_Name + '\'' +
                ", ID_Number='" + ID_Number + '\'' +
                ", Password='" + Password + '\'' +
                ", Class_Name='" + Class_Name + '\'' +
                ", User_Type_ID=" + User_Type_ID +
                '}';
    }
    
}

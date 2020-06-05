package Model.User;

import java.io.Serializable;

public class User_Type implements Serializable {
    private String User_Type;
    private int User_Type_ID;

    public String getUser_Type() {
        return User_Type;
    }

    public void setUser_Type(String user_Type) {
        User_Type = user_Type;
    }

    public int getUser_Type_ID() {
        return User_Type_ID;
    }

    public void setUser_Type_ID(int user_Type_ID) {
        User_Type_ID = user_Type_ID;
    }

    @Override
    public String toString() {
        return "User_Type{" +
                "User_Type='" + User_Type + '\'' +
                ", User_Type_ID=" + User_Type_ID +
                '}';
    }
}

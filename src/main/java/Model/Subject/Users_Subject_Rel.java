package Model.Subject;

import java.io.Serializable;

public class Users_Subject_Rel implements Serializable {
    private int User_ID;
    private int Subject_ID;



    public int getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(int user_ID) {
        User_ID = user_ID;
    }

    public int getSubject_ID() {
        return Subject_ID;
    }

    public void setSubject_ID(int subject_ID) {
        Subject_ID = subject_ID;
    }
    @Override
    public String toString() {
        return "Users_Subject_Rel{" +
                "User_ID=" + User_ID +
                ", Subject_ID=" + Subject_ID +
                '}';
    }
}

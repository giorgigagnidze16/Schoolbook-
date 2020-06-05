package Model.Homework;

public class Homework_User_Rel  extends  Homework_Rel{
    private int User_ID;

    public int getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(int user_ID) {
        User_ID = user_ID;
    }

    @Override
    public String toString() {
        return "Homework_User_Rel{" +
                "User_ID=" + User_ID +
                '}';
    }
}

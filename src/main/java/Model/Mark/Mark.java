package Model.Mark;

public class Mark {
    private int Mark;
    private int User_ID;
    private int Subject_ID;

    public int getMark() {
        return Mark;
    }

    public void setMark(int mark) {
        Mark = mark;
    }

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
        return "Mark{" +
                "Mark=" + Mark +
                ", User_ID=" + User_ID +
                ", Subject_ID=" + Subject_ID +
                '}';
    }
}

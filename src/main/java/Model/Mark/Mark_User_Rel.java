package Model.Mark;

import Model.User.User;

import java.util.Date;

public class Mark_User_Rel  extends User {
    private int Subject_ID;
    private int Mark;
    private Date MarkDate;
    int Mark_ID;

    public int getMark_ID() {
        return Mark_ID;
    }

    public void setMark_ID(int mark_ID) {
        Mark_ID = mark_ID;
    }

    public int getSubject_ID() {
        return Subject_ID;
    }

    public void setSubject_ID(int subject_ID) {
        Subject_ID = subject_ID;
    }

    public int getMark() {
        return Mark;
    }

    public void setMark(int mark) {
        Mark = mark;
    }

    public Date getMarkDate() {
        return MarkDate;
    }

    public void setMarkDate(Date markDate) {
        MarkDate = markDate;
    }

    @Override
    public String toString() {
        return "Mark_User_Rel{" +
                "Subject_ID=" + Subject_ID +
                ", Mark=" + Mark +
                ", MarkDate=" + MarkDate +
                '}';
    }
}

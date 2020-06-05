package Model.Absent;

import Model.User.User;

import java.util.Date;

public class Gacdena_User_Rel extends User {
    private Date date;
    private int Subject_ID;
    private int gacdena;
    private int Gacdena_ID;

    public int getGacdena_ID() {
        return Gacdena_ID;
    }

    public void setGacdena_ID(int gacdena_ID) {
        Gacdena_ID = gacdena_ID;
    }

    public int getGacdena() {
        return gacdena;
    }

    public void setGacdena(int gacdena) {
        this.gacdena = gacdena;
    }



    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getSubject_ID() {
        return Subject_ID;
    }

    public void setSubject_ID(int subject_ID) {
        Subject_ID = subject_ID;
    }

    @Override
    public String toString() {
        return "Gacdena_User_Rel{" +
                "date=" + date +
                ", Subject_ID=" + Subject_ID +
                ", gacdena=" + gacdena +
                '}';
    }
}

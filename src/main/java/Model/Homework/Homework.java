package Model.Homework;

import java.util.Date;

public class Homework {
    private String Class_Name;
    private int Homework_ID;

    public int getHomework_ID() {
        return Homework_ID;
    }

    public void setHomework_ID(int homework_ID) {
        Homework_ID = homework_ID;
    }
    private int Class_ID;
    private int Subject_ID;
    private Date HomeworkDate;
    private Date Deadline;
    private int Teacher_ID;
    private int DoneOrNot;
    private String Homework;
    public int getClass_ID() {
        return Class_ID;
    }

    public void setClass_ID(int class_ID) {
        Class_ID = class_ID;
    }
    public String getClass_Name() {
        return Class_Name;
    }

    public void setClass_Name(String class_Name) {
        Class_Name = class_Name;
    }



    public int getSubject_ID() {
        return Subject_ID;
    }

    public void setSubject_ID(int subject_ID) {
        Subject_ID = subject_ID;
    }

    public Date getHomeworkDate() {
        return HomeworkDate;
    }

    public void setHomeworkDate(Date homeworkDate) {
        HomeworkDate = homeworkDate;
    }

    public Date getDeadline() {
        return Deadline;
    }

    public void setDeadline(Date deadline) {
        Deadline = deadline;
    }

    public int getTeacher_ID() {
        return Teacher_ID;
    }

    public void setTeacher_ID(int teacher_ID) {
        Teacher_ID = teacher_ID;
    }

    public int getDoneOrNot() {
        return DoneOrNot;
    }

    public void setDoneOrNot(int doneOrNot) {
        DoneOrNot = doneOrNot;
    }

    public String getHomework() {
        return Homework;
    }

    public void setHomework(String homework) {
        Homework = homework;
    }

    @Override
    public String toString() {
        return "Homework{" +
                "Class_Name='" + Class_Name + '\'' +
                ", Class_ID='" + Class_ID + '\'' +
                ", Subject_ID=" + Subject_ID +
                ", HomeworkDate=" + HomeworkDate +
                ", Deadline=" + Deadline +
                ", Teacher_ID=" + Teacher_ID +
                ", DoneOrNot=" + DoneOrNot +
                ", Homework='" + Homework + '\'' +
                '}';
    }
}

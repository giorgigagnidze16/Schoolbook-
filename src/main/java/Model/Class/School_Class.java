package Model.Class;

import java.io.Serializable;

public class School_Class implements Serializable {
    private String Class_Name;
    private int Class_ID;

    public String getClass_Name() {
        return Class_Name;
    }

    public void setClass_Name(String class_Name) {
        Class_Name = class_Name;
    }

    public int getClass_ID() {
        return Class_ID;
    }

    public void setClass_ID(int class_ID) {
        Class_ID = class_ID;
    }

    @Override
    public String toString() {
        return "Class{" +
                "Class_Name='" + Class_Name + '\'' +
                ", Class_ID=" + Class_ID +
                '}';
    }
}

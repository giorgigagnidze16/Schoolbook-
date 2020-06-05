package Model.Subject;

import java.io.Serializable;

public class Subject_Rel implements Serializable {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Subject_Rel{" +
                "name='" + name + '\'' +
                '}';
    }
}

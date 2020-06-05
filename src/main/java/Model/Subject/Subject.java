package Model.Subject;

public class Subject {
    private String name;
   private  int Subject_ID;

    public int getSubject_ID() {
        return Subject_ID;
    }

    public void setSubject_ID(int subject_ID) {
        Subject_ID = subject_ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @Override
    public String toString() {
        return "Subject{" +
                "name='" + name + '\'' +
                '}';
    }
}

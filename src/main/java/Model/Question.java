package Model;
import Model.User.User;
public class Question  extends User{
    private String question;
    private String answer1;
    private String answer2;
    private String answer3;
    private String answer4;
    private String answer;
    private int pasuxi;
     private int Quiz_ID;

    public int getQuiz_ID() {
        return Quiz_ID;
    }

    public void setQuiz_ID(int quiz_ID) {
        Quiz_ID = quiz_ID;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer1() {
        return answer1;
    }

    public void setAnswer1(String answer1) {
        this.answer1 = answer1;
    }

    public String getAnswer2() {
        return answer2;
    }

    public void setAnswer2(String answer2) {
        this.answer2 = answer2;
    }

    public String getAnswer3() {
        return answer3;
    }

    public void setAnswer3(String answer3) {
        this.answer3 = answer3;
    }

    public String getAnswer4() {
        return answer4;
    }

    public void setAnswer4(String answer4) {
        this.answer4 = answer4;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getPasuxi() {
        return pasuxi;
    }

    public void setPasuxi(int pasuxi) {
        this.pasuxi = pasuxi;
    }

    @Override
    public String toString() {
        return "Question{" +
                "question='" + question + '\'' +
                ", answer1='" + answer1 + '\'' +
                ", answer2='" + answer2 + '\'' +
                ", answer3='" + answer3 + '\'' +
                ", answer4='" + answer4 + '\'' +
                ", answer='" + answer + '\'' +
                ", pasuxi=" + pasuxi +
                '}';
    }
}

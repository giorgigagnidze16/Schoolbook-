package server;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;

@ServerEndpoint("/test")
public class TestWebServer {

    private static ArrayList<Session> sessions = new ArrayList<>();

    @OnMessage
    public void hello(String message) {
        for (Session s : sessions) {
            try {
                s.getBasicRemote().sendText(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @OnOpen
    public void myOnOpen(Session session) {
        System.out.println("Connection opened");
        sessions.add(session);

    }

    @OnClose
    public void myOnClose(CloseReason reason) {
        for (int i = 0; i <= sessions.size(); i++) {

            if (!sessions.get(i).isOpen()) {
                sessions.remove(i);
            }
        }
        System.out.println("Connction closed");
    }

    @OnError
    public void error(Throwable t) {
        System.out.println("Error ");
    }
}
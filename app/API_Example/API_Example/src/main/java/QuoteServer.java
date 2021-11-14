import Database.TestDatabase;
import io.javalin.Javalin;

import static io.javalin.apibuilder.ApiBuilder.*;

//web api layer

public class QuoteServer {
    private final Javalin server;

    public QuoteServer() {
        server = Javalin.create(config -> {
            config.defaultContentType = "application/json";
        });

        this.server.get("/quotes", context -> QuoteApiHandler.getAll(context));
        this.server.get("/quotes/{id}", context -> QuoteApiHandler.getOne(context));
        this.server.post("/quotes", context -> QuoteApiHandler.create(context));
    }

    public static void main(String[] args) {
        QuoteServer server = new QuoteServer();
        server.start(5000);
    }

    public void start(int port) {
        this.server.start(port);
    }

    public void stop() {
        this.server.stop();
    }
}
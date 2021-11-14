import Model.Quotes;
import Database.TestDatabase;
import com.google.gson.Gson;
import io.javalin.http.Context;
import io.javalin.http.HttpCode;
import io.javalin.http.NotFoundResponse;
import org.json.simple.JSONObject;

//web api layer


public class QuoteApiHandler {
    private static final TestDatabase database = new TestDatabase();

    /**
     * Get all quotes
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
    public static void getAll(Context context) {
        database.ReadAllQuotes();
        context.json(TestDatabase.quotes);
    }

    /**
     * Get one quote
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
    public static void getOne(Context context) {
        database.ReadAllQuotes();
        Integer id = context.pathParamAsClass("id", Integer.class).get();
        Quotes quotes = TestDatabase.quotes.get(id);
        if (quotes == null) {
            throw new NotFoundResponse("Model.Quote not found: " + id);
        }
        context.json(quotes);
    }

    /**
     * Create a new quote
     *
     * @param context The Javalin Context for the HTTP POST Request
     */

    public static void create(Context context) {
        Quotes quotes = context.bodyAsClass(Quotes.class);
        TestDatabase.quotes.add(quotes);
        Quotes newQuotes = TestDatabase.quotes.get(TestDatabase.quotes.size()-1);
        newQuotes.setId(Integer.toString(TestDatabase.quotes.size()));
        database.CreateNewQuote(newQuotes);
        context.header("Location", "/quotes/" + newQuotes.getId());
        context.status(HttpCode.CREATED);
        context.json(newQuotes);
    }
}
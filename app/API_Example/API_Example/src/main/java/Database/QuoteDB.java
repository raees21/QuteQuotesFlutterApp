package Database;

import Model.Quotes;

import java.util.List;

//data access layer

public interface QuoteDB {
    /**
     * Get a single quote by id.
     * @param id the Id of the quote
     * @return a Model.Quote
     */
    Quotes get(Integer id);

    /**
     * Get all quotes in the database
     * @return A list of quotes
     */
    List<Quotes> all();

    public void CreateNewQuote(Quotes o);

    public void ReadAllQuotes();
}
package Model;

public class Quotes {
    //domain layer
    private String id;
    private String quote;
    private String author;

    //curl --request POST "http://localhost:5000/quotes" -d "{\"id\": 1, \"quote\":\"Meow\", \"author\":\"The Cat\"}" --include

    public Quotes(){

    }

    public Quotes(String id, String quote, String author){
        this.id = id;
        this.quote = quote;
        this.author = author;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getQuote() {
        return quote;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}

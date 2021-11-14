package Database;

import Database.pkg.DBCreate;
import Database.pkg.DBRead;
import Model.Quotes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//data access layer

public class TestDatabase implements QuoteDB {
    String dbUrl;
    public static List<Quotes> quotes = new ArrayList<>();
    public static Connection connection;
    private DBCreate dbCreate;
    private DBRead dbRead;

    public TestDatabase() {

        String name = "API_Example/src/main/resources/QuoteDB.db";

        this.dbUrl = "jdbc:sqlite:"+name;
        System.out.println(dbUrl);
        try {
            connection = DBConnection();
        } catch (Exception e) {}
        System.out.println(connection);

        dbCreate = new DBCreate();
        dbRead = new DBRead();
    }

    public Connection DBConnection() throws SQLException {
        final Connection connection = DriverManager.getConnection( this.dbUrl );
        return connection;
    }

    @Override
    public Quotes get(Integer id) {
        return quotes.get(id);
    }

    @Override
    public List<Quotes> all() {
        return new ArrayList<>(quotes);
    }


    @Override
    public void CreateNewQuote(Quotes o) {dbCreate.CreateNewQuote(o);}

    @Override
    public void ReadAllQuotes() {dbRead.ReadAllQuotes();}

}
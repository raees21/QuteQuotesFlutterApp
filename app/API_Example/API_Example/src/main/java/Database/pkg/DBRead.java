package Database.pkg;

import Model.Quotes;
import Database.TestDatabase;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBRead {

    public DBRead() {

    }

    public void ReadAllQuotes(){
        try (PreparedStatement st = TestDatabase.connection.prepareStatement("SELECT * FROM Quotes;")){
            boolean gotAResultSet = st.execute();

            if (!gotAResultSet) {
                throw new RuntimeException("Expected a SQL resultSet, but we got an update count instead!");
            }

            try(ResultSet results = st.getResultSet() ){
                TestDatabase.quotes.clear();
                while( results.next() ) {
                    final String id = results.getString("id");
                    final String quote = results.getString( "quote" );
                    final String author = results.getString( "author" );
                    Quotes newQuotes = new Quotes(id, quote, author);
                    TestDatabase.quotes.add(newQuotes);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

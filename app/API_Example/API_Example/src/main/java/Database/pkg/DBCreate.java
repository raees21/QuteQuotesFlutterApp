package Database.pkg;

import Model.Quotes;
import Database.TestDatabase;

import java.sql.PreparedStatement;

public class DBCreate {
    public DBCreate() {

    }

    public void CreateNewQuote(Quotes o) {

        try (PreparedStatement st = TestDatabase.connection.prepareStatement("INSERT INTO Quotes(quote, author) VALUES(?, ?);")){
            st.setString(1, o.getQuote());
            st.setString(2, o.getAuthor());
            st.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}

package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author guilherme
 */
public class Conexao {
    public Connection getConexao(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/bdbytestore?useTimezone=true&serverTimezone=UTC",
            "root", "");
            
            System.out.println(" conexão realizada com sucesso ");
            return conn;
        }
            catch (Exception e){
                    System.out.println("Erro ao conectar ao banco ByteStore: " +e.getMessage());
                    return null;
                    }
                
            
        }
        }
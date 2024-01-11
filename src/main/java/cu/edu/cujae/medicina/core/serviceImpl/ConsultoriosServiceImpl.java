package cu.edu.cujae.medicina.core.serviceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import cu.edu.cujae.medicina.core.service.ConsultoriosService;
import cu.edu.cujae.medicina.core.dto.Consultorios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.stream.Collectors;

@Service
public class ConsultoriosServiceImpl implements ConsultoriosService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void inserta_consultorio(Consultorios consultorios) throws Exception {
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select consultorios_insert(?,?)");
        preparedStatement.setString(1,consultorios.getNumero());
        preparedStatement.setLong(2,consultorios.getPiso());
        preparedStatement.execute();
        preparedStatement.close();
        con.close();
    }

    @Override
    public void modificar_consultorio(Consultorios consultorios) throws Exception {
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select consultorios_update(?,?,?)");
        preparedStatement.setLong(1,consultorios.getId());
        preparedStatement.setString(2,consultorios.getNumero());
        preparedStatement.setLong(3,consultorios.getPiso());
        preparedStatement.execute();
        preparedStatement.close();
        con.close();
    }

    @Override
    public void eliminar_consultorios(Long id) throws Exception {
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select consultorios_delete(?)");
        preparedStatement.setLong(1,id);
        preparedStatement.execute();
        preparedStatement.close();
        con.close();
    }

    @Override
    public ArrayList<Consultorios> listado_consultorios() throws Exception {
        ArrayList<Consultorios> consultorios = new ArrayList<>();
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select * From consultorios");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            Consultorios consultorio = new Consultorios(resultSet.getLong(1),resultSet.getString(2),resultSet.getLong(3));
            consultorios.add(consultorio);
        }
        return consultorios;
    }

    @Override
    public ArrayList<String> listado_consultorios_numero() throws Exception {
        return (ArrayList<String>) listado_consultorios().stream().map(consultorios -> consultorios.getNumero()).collect(Collectors.toList());
    }

    @Override
    public Consultorios obtener_consultorios(long id) throws Exception {
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select * From consultorios WHERE id = ?");
        preparedStatement.setLong(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            Consultorios consultorio = new Consultorios(resultSet.getLong(1),resultSet.getString(2),resultSet.getLong(3));
            return consultorio;
        }
        return null;
    }
}

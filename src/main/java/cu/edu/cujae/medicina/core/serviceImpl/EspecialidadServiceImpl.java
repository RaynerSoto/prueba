package cu.edu.cujae.medicina.core.serviceImpl;

import cu.edu.cujae.medicina.core.dto.Especialidad;
import cu.edu.cujae.medicina.core.service.EspecialidadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.stream.Collectors;

@Service
public class EspecialidadServiceImpl implements EspecialidadService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void inserta_especialidad(Especialidad especialidad) throws Exception {
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select especialidad_insert(?)");
        preparedStatement.setString(1,especialidad.getNombre());
        preparedStatement.execute();
        preparedStatement.close();
        con.close();
    }

    @Override
    public void modificar_especialidad(Especialidad especialidad) throws Exception {
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select especialidad_update(?,?)");
        preparedStatement.setLong(1,especialidad.getId());
        preparedStatement.setString(2,especialidad.getNombre());
        preparedStatement.execute();
        preparedStatement.close();
        con.close();
    }

    @Override
    public void eliminar_especialidad(Long id) throws Exception {
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select especialidad_delete(?)");
        preparedStatement.setLong(1,id);
        preparedStatement.execute();
        preparedStatement.close();
        con.close();
    }

    @Override
    public ArrayList<Especialidad> listado_especialidades() throws Exception {
        ArrayList<Especialidad> especialidades = new ArrayList<>();
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select * From especialidades");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            Especialidad especialidad = new Especialidad(resultSet.getLong(1),resultSet.getString(2));
            especialidades.add(especialidad);
        }
        return especialidades;
    }

    @Override
    public ArrayList<String> listado_especialidades_nombre() throws Exception {
        return (ArrayList<String>) listado_especialidades().stream().map(especialidad -> especialidad.getNombre()).collect(Collectors.toList());
    }

    @Override
    public Especialidad obtener_especialidad(long id) throws Exception {
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select * From especialidades WHERE id = ?");
        preparedStatement.setLong(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            Especialidad especialidad = new Especialidad(resultSet.getLong(1),resultSet.getString(2));
            return especialidad;
        }
        return null;
    }
}

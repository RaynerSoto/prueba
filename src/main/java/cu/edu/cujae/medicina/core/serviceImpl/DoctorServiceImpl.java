package cu.edu.cujae.medicina.core.serviceImpl;

import com.fasterxml.jackson.databind.annotation.JsonAppend;
import cu.edu.cujae.medicina.core.dto.Consultorios;
import cu.edu.cujae.medicina.core.dto.Doctor;
import cu.edu.cujae.medicina.core.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void inserta_doctor(Doctor doctor) throws Exception {
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select doctores_insert(?,?,?,?)");
        preparedStatement.setString(1,doctor.getNombre());
        preparedStatement.setString(2,doctor.getApellido_paterno());
        preparedStatement.setString(3,doctor.getApellido_materno());
        preparedStatement.setLong(4,doctor.getEspecialidad().getId());
        preparedStatement.execute();
        preparedStatement.close();
        con.close();
    }

    @Override
    public void modificar_doctor(Doctor doctor) throws Exception {
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select doctores_update(?,?,?,?,?)");
        preparedStatement.setString(1,doctor.getNombre());
        preparedStatement.setString(2,doctor.getApellido_paterno());
        preparedStatement.setString(3,doctor.getApellido_materno());
        preparedStatement.setLong(4,doctor.getEspecialidad().getId());
        preparedStatement.setLong(5,doctor.getId());
        preparedStatement.execute();
        preparedStatement.close();
        con.close();
    }

    @Override
    public void eliminar_doctor(Long id) throws Exception {
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select doctores_delete(?)");
        preparedStatement.setLong(1,id);
        preparedStatement.execute();
        preparedStatement.close();
        con.close();
    }

    @Override
    public ArrayList<Doctor> listado_doctores() throws Exception {
        ArrayList<Doctor> doctores = new ArrayList<>();
        Connection con = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = con.prepareStatement("Select * From doctores");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            Doctor doctor = new Doctor(resultSet.getLong(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getLong(5));
            doctores.add(doctor);
        }
        return doctores;
    }

    @Override
    public ArrayList<String> listado_doctores_nombre() throws Exception {
        return null;
    }

    @Override
    public Doctor obtener_doctor(long id) throws Exception {
        return null;
    }
}

package repository;

import model.HinhThucThanhToan;
import model.PhongTro;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IPhongTroRepository {
    List<PhongTro> selectAllPhongTro();

    PhongTro selectPhongTro(int idKey);

    public boolean deletePhongTro(int id) throws SQLException;

    List<HinhThucThanhToan> selectAllHinhThucThanhToan();

    void insertPhongTro(PhongTro phongTro) throws SQLException;

    public boolean updatePhongTro(PhongTro phongTro) throws SQLException;

    List<PhongTro> search(String id, String name, String phoneNumber);

    List<PhongTro> searchNameAndPhoneNumber(String searchName,String searchPhoneNumber);
}

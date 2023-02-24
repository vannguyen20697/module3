package Service;

import model.HinhThucThanhToan;
import model.PhongTro;

import java.sql.SQLException;
import java.util.List;

public interface IService {
    List<PhongTro> selectAllPhongTro();

    PhongTro selectPhongTro(int idKey);

    public boolean deletePhongTro(int id) throws SQLException;

    List<HinhThucThanhToan> selectAllHinhThucThanhToan();

    void insertPhongTro(PhongTro phongTro) throws SQLException;

    public boolean updatePhongTro(PhongTro phongTro) throws SQLException;

    List<PhongTro> search(String keySearch);
}

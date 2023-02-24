package Service;

import model.HinhThucThanhToan;
import model.PhongTro;
import repository.IPhongTroRepository;
import repository.PhongTroRepository;

import java.sql.SQLException;
import java.util.List;

public class ServiceImpl implements IService {
    private  static final IPhongTroRepository REPOSITORY = new PhongTroRepository();
    @Override
    public List<PhongTro> selectAllPhongTro() {
        return REPOSITORY.selectAllPhongTro();
    }

    @Override
    public PhongTro selectPhongTro(int idKey) {
        return REPOSITORY.selectPhongTro(idKey);
    }

    @Override
    public boolean deletePhongTro(int id) throws SQLException {
        return REPOSITORY.deletePhongTro(id);
    }

    @Override
    public List<HinhThucThanhToan> selectAllHinhThucThanhToan() {
        return REPOSITORY.selectAllHinhThucThanhToan();
    }

    @Override
    public void insertPhongTro(PhongTro phongTro) throws SQLException {
        REPOSITORY.insertPhongTro(phongTro);
    }

    @Override
    public boolean updatePhongTro(PhongTro phongTro) throws SQLException {
        return REPOSITORY.updatePhongTro(phongTro);
    }

    @Override
    public List<PhongTro> search(String keySearch) {
        return REPOSITORY.search(keySearch);
    }
}

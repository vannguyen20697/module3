package controller;

import model.HinhThucThanhToan;
import model.PhongTro;
import repository.IPhongTroRepository;
import repository.PhongTroRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "PhongTRoServlet", value = "/phongtro")
public class PhongTroServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IPhongTroRepository phongTroService;

    public void init() {
        phongTroService = new PhongTroRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                try {
                    deletePhongTro(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "find":
//                    listPhongTroById(request, response);
                break;
            case "sort":
//                    sortUserByName(request, response);
            default:
                listPhongTro(request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertPhongTro(request, response);
                    break;
                case "update":
                    updatePhongTro(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listPhongTro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PhongTro> listPhong = phongTroService.selectAllPhongTro();
        request.setAttribute("listPhongTro", listPhong);
        request.getRequestDispatcher("phongtro/list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<HinhThucThanhToan> hinhThucThanhToanList = phongTroService.selectAllHinhThucThanhToan();
        request.setAttribute("hinhThucThanhToanList", hinhThucThanhToanList);
        request.getRequestDispatcher("phongtro/create.jsp").forward(request, response);
    }

    private void insertPhongTro(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String dateBegin = request.getParameter("dateBegin");
        String note = request.getParameter("note");
        int idThanhToan = Integer.parseInt(request.getParameter("idThanhToan"));
        PhongTro newPhongTro = new PhongTro(name, phoneNumber, dateBegin, note, idThanhToan);
        phongTroService.insertPhongTro(newPhongTro);
        request.getRequestDispatcher("phongtro/create.jsp").forward(request, response);
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PhongTro phongTro = phongTroService.selectPhongTro(id);
        List<HinhThucThanhToan> hinhThucThanhToanList = phongTroService.selectAllHinhThucThanhToan();
        request.setAttribute("hinhThucThanhToanList", hinhThucThanhToanList);
        request.setAttribute("phongtro", phongTro);
        request.getRequestDispatcher("phongtro/edit.jsp").forward(request, response);
    }
    private void updatePhongTro(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String dateBegin = request.getParameter("dateBegin");
        String note = request.getParameter("note");
        int idThanhToan = Integer.parseInt(request.getParameter("idThanhToan"));
        PhongTro phongTro = new PhongTro(id, name, phoneNumber, dateBegin, note, idThanhToan);
        phongTroService.updatePhongTro(phongTro);
        response.sendRedirect("/phongtro");
    }
    private void deletePhongTro(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        phongTroService.deletePhongTro(id);
        response.sendRedirect("/phongtro");
    }

}

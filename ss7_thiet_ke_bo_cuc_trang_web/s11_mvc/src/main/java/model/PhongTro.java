package model;

public class PhongTro {
    private int id;
    private String name;
    private String phoneNumber;
    private String dateBegin;
    private String note;
    private int idThanhToan;
    private String nameThanhToan;

    public PhongTro() {
    }

    public PhongTro(int id, String name, String phoneNumber, String dateBegin, String note, String nameThanhToan) {
        this.id = id;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.dateBegin = dateBegin;
        this.note = note;
        this.nameThanhToan = nameThanhToan;
    }

    public String getNameThanhToan() {
        return nameThanhToan;
    }

    public void setNameThanhToan(String nameThanhToan) {
        this.nameThanhToan = nameThanhToan;
    }

    public PhongTro(int id, String name, String phoneNumber, String dateBegin, String note, int idThanhToan) {
        this.id = id;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.dateBegin = dateBegin;
        this.note = note;
        this.idThanhToan = idThanhToan;
    }

    public PhongTro(String name, String phoneNumber, String dateBegin, String note, int idThanhToan) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.dateBegin = dateBegin;
        this.note = note;
        this.idThanhToan = idThanhToan;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDateBegin() {
        return dateBegin;
    }

    public void setDateBegin(String dateBegin) {
        this.dateBegin = dateBegin;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getIdThanhToan() {
        return idThanhToan;
    }

    public void setIdThanhToan(int idThanhToan) {
        this.idThanhToan = idThanhToan;
    }
}

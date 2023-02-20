package model;

public class HinhThucThanhToan {
    private int id;
    private String name;

    public HinhThucThanhToan(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public HinhThucThanhToan() {
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
}

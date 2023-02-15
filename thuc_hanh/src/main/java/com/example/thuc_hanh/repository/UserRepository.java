package com.example.thuc_hanh.repository;

import com.example.thuc_hanh.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    /**
     * private static final String ALL_USER = "select * from user_manager";
     *
     * @Override public List<User> findAll(){
     * //b1: tao connection
     * Connection connection = DBConnection.getConnection();
     * // b2: khai bao
     * PreparedStatement statement = null;
     * ResultSet resultSet = null;
     * List<User> userList = new ArrayList<>();
     * if (connection != null){
     * try {
     * statement = connection.prepareStatement(ALL_USER);
     * resultSet = statement.executeQuery();
     * <p>
     * User user = null;
     * while (resultSet.next()){
     * int id = resultSet.getInt("id");
     * String name = resultSet.getString("name");
     * String email = resultSet.getString("email");
     * String country = resultSet.getString("country");
     * user = new User(id,name,email,country);
     * userList.add(user);
     * }
     * }catch (SQLException e) {
     * throw new RuntimeException(e);
     * } finally {
     * try {
     * resultSet.close();
     * statement.close();
     * }catch (SQLException e){
     * throw  new RuntimeException(e);
     * }
     * DBConnection.close();
     * }
     * }
     * return userList;
     * }
     **/
//
//    private String jdbcURL = "jdbc:mysql://localhost:3306/user_manager?useSSL=false";
//    private String jdbcUsername = "root";
//    private String jdbcPassword = "123456789";

    private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, email, country) VALUES " +
            " (?, ?, ?);";

    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USER_BY_COUNTRY = "select * from users where country like ?;";
    private static final String SORT_USER_BY_NAME = "select * from users order by `name` asc;";

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);

            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public List<User> selectUserByCountry(String country) {
        List<User> users = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY)) {
            preparedStatement.setString(1, "%" + country + "%");
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    //    @Override
//    public List<User> findAll(String country) {
//        List<User> users = new ArrayList<>();
//
//        try (Connection connection = getConnection();
////             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY.replace("?", country));) {
//             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY)) {
//            preparedStatement.setString(1, "%" + country + "%");
//            System.out.println(preparedStatement);
//
//            ResultSet rs = preparedStatement.executeQuery();
//
//            while (rs.next()) {
//                int id = rs.getInt("id");
//                String name = rs.getString("name");
//                String email = rs.getString("email");
//                country = rs.getString("country");
//                users.add(new User(id, name, email, country));
//            }
//        } catch (SQLException e) {
//            printSQLException(e);
//        }
//        return users;
//    }
    @Override
    public List<User> sortUserByName() {
        List<User> users = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SORT_USER_BY_NAME);) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public User getUserById(int id) {
        User user = null;
//        String query = "{CALL get_user_by_id(?)}";
        CallableStatement statement = null;
        ResultSet rs = null;
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try {
                statement = connection.prepareCall("{CALL get_user_by_id(?)}");
                statement.setInt(1,id);
                rs = statement.executeQuery();
                while (rs.next()){
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String country = rs.getString("country");
                    user = new User(id,name,email,country);
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    rs.close();
                    statement.close();
                    connection.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        return user;
    }


    @Override
    public void insertUserStore(User user) throws SQLException {
//        String query = "{CALL insert_user(?,?,?)}";
        CallableStatement statement = null;
        Savepoint savepoint = null;
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try {
                statement = connection.prepareCall("{CALL insert_user(?,?,?)}"); //KET NOI DEN sql
                statement.setString(1, user.getName());
                statement.setString(2, user.getEmail());
                statement.setString(3, user.getCountry());
                statement.executeUpdate();
                savepoint = connection.setSavepoint();
                connection.commit();

            } catch (SQLException e) {
                if (savepoint != null){
                    connection.rollback(savepoint);
                    connection.commit();
                }
                connection.rollback();
                throw new RuntimeException(e);
            }finally {
                try {
                    statement.close();
                }catch (SQLException e){
                    throw new RuntimeException(e);
                }
                connection.setAutoCommit(true);
                DBConnection.close();
            }
        }
    }
}

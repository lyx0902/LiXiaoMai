package com.example.lixiaomai.backend.dao;

import com.example.lixiaomai.backend.entity.Product;
import com.example.lixiaomai.backend.tools.DatabaseUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ProductDao {
    private final QueryRunner runner = DatabaseUtils.getRunner();

    public List<Product> getAllProductBySid(int sId) {
        try {
            Connection conn = DatabaseUtils.getConnection();
            String sql = "SELECT * FROM Product WHERE sId = ?";
            return runner.query(conn, sql, new BeanListHandler<>(Product.class), sId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean addProduct(Product product) {

        try {
            String sql = "INSERT INTO PRODUCT (NAME, PRICE, STOCK, TYPE, DESCRIPTION, SID) VALUES (?,?,?,?,?,?)";
            Connection conn = DatabaseUtils.getConnection();
            return runner.update(conn,
                    sql,
                    product.getName(), product.getPrice(), product.getStock(), product.getType(), product.getDescription(), product.getSId()) > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }




}

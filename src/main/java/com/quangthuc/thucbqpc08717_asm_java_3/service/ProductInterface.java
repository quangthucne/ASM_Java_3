package com.quangthuc.thucbqpc08717_asm_java_3.service;

import com.quangthuc.thucbqpc08717_asm_java_3.model.ProductModel;

import java.util.List;

public interface ProductInterface {
    String TABLE_NAME_PRODUCT = "product";
    String TABLE_NAME_IMAGE = "[image]";
    String TABLE_NAME_CATEGORY = "category";
    String COLUMN_ID_PRODUCT = "id_product";
    String COLUMN_ID_CATEGORY = "id_category";
    String COLUMN_NAME = "name_product";
    String COLUMN_SHORT_DESC = "short_desc";
    String COLUMN_DETAIL = "detail";
    String COLUMN_QUANTITY = "quantity";
    String COLUMN_PRICE = "price";
    String COLUMN_DATE_CREATED = "date_created";
    String COLUMN_STATUS = "status_product";
    String COLUMN_ID_IMAGE = "id_image";
    String COLUMN_NAME_IMAGE = "name_image";
    String COLUMN_NAME_CATEGORY = "name_category";
    String GETDATE = "GETDATE()";

    //    String PRODUCT_SELECT_ALL = String.format("SELECT * FROM %s", TABLE_NAME);
    String PRODUCT_SELECT_BY_ID = String.format("SELECT * FROM %s WHERE %s = ?", TABLE_NAME_PRODUCT, COLUMN_ID_PRODUCT);
    String PRODUCT_INSERT = String.format("INSERT INTO %s (%s, %s, %s, %s, %s, %s, %s, %s) VALUES (?, ?, ?, ?, ?, ?, %s, ?)", TABLE_NAME_PRODUCT, COLUMN_ID_CATEGORY, COLUMN_NAME, COLUMN_SHORT_DESC, COLUMN_DETAIL, COLUMN_QUANTITY, COLUMN_PRICE, COLUMN_DATE_CREATED, COLUMN_STATUS, GETDATE);
    String PRODUCT_UPDATE = String.format("UPDATE %s SET %s = ?, %s = ?, %s = ?, %s = ?, %s = ?, %s = ? WHERE %s = ?", TABLE_NAME_PRODUCT, COLUMN_ID_CATEGORY, COLUMN_NAME, COLUMN_SHORT_DESC, COLUMN_DETAIL, COLUMN_PRICE, COLUMN_STATUS, COLUMN_ID_PRODUCT);
    String PRODUCT_DELETE = String.format("DELETE FROM %s WHERE %s = ?", TABLE_NAME_PRODUCT, COLUMN_ID_PRODUCT);
    String PRODUCT_SELECT_BY_NAME = String.format("SELECT * FROM %s WHERE %s LIKE ?", TABLE_NAME_PRODUCT, COLUMN_NAME);

    // check query before excute()
    String PRODUCT_SELECT_ALL_TEMP = String.format("SELECT %s.%s , %s.%s, %s.%s, %s.%s, %s.%s, %s.%s, %s.%s, %s.%s, %s.%s, %s.%s, %s.%s FROM %s INNER JOIN %s  ON %s.%s = %s.%s INNER JOIN (SELECT %s, %s, MIN(%s) AS name_image FROM %s GROUP BY %s, %s) %s  ON %s.%s = %s.%s",
            TABLE_NAME_PRODUCT, COLUMN_ID_PRODUCT, TABLE_NAME_PRODUCT, COLUMN_ID_CATEGORY, TABLE_NAME_PRODUCT, COLUMN_NAME, TABLE_NAME_PRODUCT, COLUMN_SHORT_DESC, TABLE_NAME_PRODUCT, COLUMN_DETAIL, TABLE_NAME_PRODUCT, COLUMN_QUANTITY, TABLE_NAME_PRODUCT, COLUMN_PRICE, TABLE_NAME_PRODUCT, COLUMN_DATE_CREATED, TABLE_NAME_PRODUCT, COLUMN_STATUS, TABLE_NAME_CATEGORY, COLUMN_NAME_CATEGORY, TABLE_NAME_IMAGE, COLUMN_NAME_IMAGE,
            TABLE_NAME_PRODUCT,
            TABLE_NAME_CATEGORY, TABLE_NAME_PRODUCT, COLUMN_ID_CATEGORY, TABLE_NAME_CATEGORY, COLUMN_ID_CATEGORY,
            COLUMN_ID_PRODUCT, COLUMN_ID_IMAGE, COLUMN_NAME_IMAGE,
            TABLE_NAME_IMAGE,
            COLUMN_ID_PRODUCT, COLUMN_ID_IMAGE, TABLE_NAME_IMAGE, TABLE_NAME_PRODUCT, COLUMN_ID_PRODUCT, TABLE_NAME_IMAGE, COLUMN_ID_PRODUCT
    );

    String PRODUCT_SELECT_ALL = String.format("SELECT %s.%s , %s.%s, %s.%s, %s.%s, %s.%s, %s.%s, %s.%s, %s.%s, %s.%s, %s.%s, img.%s FROM %s INNER JOIN %s  ON %s.%s = %s.%s INNER JOIN (SELECT %s, %s, ROW_NUMBER() OVER (PARTITION BY %s ORDER BY %s) AS row_num FROM %s) AS img ON %s.%s = img.%s AND img.row_num = 1;",
            TABLE_NAME_PRODUCT, COLUMN_ID_PRODUCT, TABLE_NAME_PRODUCT, COLUMN_ID_CATEGORY, TABLE_NAME_PRODUCT, COLUMN_NAME, TABLE_NAME_PRODUCT, COLUMN_SHORT_DESC, TABLE_NAME_PRODUCT, COLUMN_DETAIL, TABLE_NAME_PRODUCT, COLUMN_QUANTITY, TABLE_NAME_PRODUCT, COLUMN_PRICE, TABLE_NAME_PRODUCT, COLUMN_DATE_CREATED, TABLE_NAME_PRODUCT, COLUMN_STATUS, TABLE_NAME_CATEGORY, COLUMN_NAME_CATEGORY, COLUMN_NAME_IMAGE,
            TABLE_NAME_PRODUCT,
            TABLE_NAME_CATEGORY, TABLE_NAME_PRODUCT, COLUMN_ID_CATEGORY, TABLE_NAME_CATEGORY, COLUMN_ID_CATEGORY,
            COLUMN_ID_PRODUCT, COLUMN_NAME_IMAGE, COLUMN_ID_PRODUCT, COLUMN_NAME_IMAGE, TABLE_NAME_IMAGE, TABLE_NAME_PRODUCT, COLUMN_ID_PRODUCT, COLUMN_ID_PRODUCT

    );

    public List<ProductModel> selectAll();

    public ProductModel selectById(int id);

    public int insert(ProductModel productModel);

    public boolean update(ProductModel productModel);

    public boolean delete(int id);

    public List<ProductModel> selectByName(String name);

}

-- Active: 1665131827383@@127.0.0.1@3306@greenvillage


-- ajouter des produits


DELIMITER |

CREATE PROCEDURE AddProduct( 
    IN name VARCHAR(50), 
    IN description VARCHAR(150), 
    IN reference VARCHAR(50), 
    IN price INT,
    IN content VARCHAR(150),
    IN discount DECIMAL(3,2),
    IN discount_rate DECIMAL(8,2),
    IN stock_quantity INT,
    IN category_id INT,
    IN supplier_id INT
    )
    BEGIN
        INSERT INTO product(
            product_name, 
            product_description, 
            product_reference, 
            product_price, 
            product_content, 
            product_discount, 
            product_discount_rate, 
            product_stock_quantity, 
            product_category_id, 
            product_supplier_id
            )
            VALUES (
                name,
                description,
                reference,
                price,
                content,
                discount,
                discount_rate,
                stock_quantity,
                category_id,
                supplier_id
            )
;
    END

DELIMITER ;
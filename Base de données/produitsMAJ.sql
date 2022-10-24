-- Active: 1665131827383@@127.0.0.1@3306@greenvillage


-- ajouter des produits


DELIMITER |

CREATE PROCEDURE AddProduct( 
    IN name VARCHAR(50), 
    IN description VARCHAR(150), 
    IN reference VARCHAR(50), 
    IN price INT,
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
                discount,
                discount_rate,
                stock_quantity,
                category_id,
                supplier_id
            )
;
    END |

DELIMITER ;

-- supprimer des produits

DELIMITER |

CREATE PROCEDURE DeleteProduct(
    IN id INT 
)
BEGIN
DELETE FROM product
WHERE product_id = id
;
END |

DELIMITER ;

CALL PROCEDURE DeleteProduct (123);




-- modifier les caractéristiques (libellé, caractéristique, tarif) d'un produit

DELIMITER |

CREATE PROCEDURE UpdateProduct (
    IN name varchar(50),
    IN description varchar(150) ,
    IN price decimal(8,2),
    IN id INT 
)
BEGIN
UPDATE product
SET 
        product_name = name,
        product_description = description,
        product_price = price
WHERE product_id = id
;
END |

DELIMITER;

CALL PROCEDURE UpdateProduct ("patate", "bintje", 12.25, 123);


-- modifier l'arborescence des catégories


DELIMITER |

CREATE PROCEDURE UpdateCategoryParent (
    IN id INT ,
    IN parent_id INT
)
BEGIN
UPDATE category 
SET 
    category_parent_id = parent_id
WHERE category_id = id
;
END |

DELIMITER;

CALL PROCEDURE UpdateCategoryParent (123, 124);
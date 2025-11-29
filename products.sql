SELECT * FROM products 


-- Requête SQL pour catégoriser les produits en fonction de leur prix

SELECT 
    ProductID,  
    ProductName,  
    Price, 
    -- Category, 

    CASE -- Catégorise les produits en fonction de leur prix : Faible, Moyen ou Élevé
        WHEN Price < 50 THEN 'Faible'  
        WHEN Price BETWEEN 50 AND 200 THEN 'Moyen'  
        ELSE 'Élevé'  
    END AS PriceCategory  

FROM 
    dbo.products;  
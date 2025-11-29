SELECT * FROM customer_reviews

-- Requête pour nettoyer les problèmes d'espaces blancs dans la colonne ReviewText

SELECT 
    ReviewID,  
    CustomerID,  
    ProductID,  
    ReviewDate,  
    Rating,  
    
    REPLACE(ReviewText, '  ', ' ') AS ReviewText
FROM 
    dbo.customer_reviews;  
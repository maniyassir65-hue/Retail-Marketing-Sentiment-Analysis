SELECT * FROM customer_journey


-- CTE (Expression de table commune) pour identifier et étiqueter les enregistrements dupliqués

WITH DuplicateRecords AS (
    SELECT 
        JourneyID,  
        CustomerID,  
        ProductID,  
        VisitDate,  
        Stage, 
        Action, 
        Duration,  
        -- Utilise ROW_NUMBER() pour attribuer un numéro de ligne unique à chaque enregistrement dans la partition définie ci-dessous
        ROW_NUMBER() OVER (
            -- PARTITION BY regroupe les lignes en fonction des colonnes spécifiées qui devraient être uniques
            PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action  
            -- ORDER BY définit comment ordonner les lignes dans chaque partition (généralement par un identifiant unique comme JourneyID)
            ORDER BY JourneyID  
        ) AS row_num  -- Crée une nouvelle colonne 'row_num' qui numérote chaque ligne dans sa partition
    FROM 
        dbo.customer_journey  
)

-- Sélectionne tous les enregistrements de la CTE où row_num > 1, ce qui indique des entrées dupliquées
    
SELECT *
FROM DuplicateRecords
ORDER BY JourneyID
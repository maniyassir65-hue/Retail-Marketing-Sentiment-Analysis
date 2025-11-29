SELECT * FROM engagement_data


-- Requête pour nettoyer et normaliser la table engagement_data

SELECT 
    EngagementID,  
    ContentID,  
    CampaignID,  --  campagne marketing
    ProductID,  
    UPPER(REPLACE(ContentType, 'Socialmedia', 'Social Media')) AS ContentType,  
    LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) AS Views,  -- Extrait la partie 'Vues' de la colonne ViewsClicksCombined en prenant la sous-chaîne avant le caractère '-'
    RIGHT(ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks,  -- Extrait la partie 'Clics' de la colonne ViewsClicksCombined en prenant la sous-chaîne après le caractère '-'
    Likes, 
    
    FORMAT(CONVERT(DATE, EngagementDate), 'dd.MM.yyyy') AS EngagementDate  
FROM 
    dbo.engagement_data  
WHERE 
    ContentType != 'Newsletter';  -- Filtre les lignes où le type de contenu est 'Newsletter' car elles ne sont pas pertinentes pour notre analyse
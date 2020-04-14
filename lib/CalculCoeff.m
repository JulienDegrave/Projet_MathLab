%fonction calculant les coeffs de chaque eleve
function tableauNote = CalculCoeff(tableauNote, tableauCoeff)

    %recupération des coeffs
    listeCoeffs = str2double(tableauCoeff(3,:));
    
    %duplication de la ligne des coeffs pour chaque eleve
    coeff = repmat(listeCoeffs,length(tableauNote.nom),1);
    
    %mise a 0 des coeff pour les notes excusées
    coeff(isnan(tableauNote.inf))=0;
    
    %mise à 0 des notes excusées(sinon bug avec NaN)
    tableauNote.inf(isnan(tableauNote.inf))=0;
    tableauNote.sup(isnan(tableauNote.sup))=0;
    
    %ajout du tableau de coeff au tableau principal
    tableauNote = addvars(tableauNote, coeff);
end
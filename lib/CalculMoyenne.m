%fonction calculant les moyennes finales
function tableauNote = CalculMoyenne(tableauNote)
    %multiplication des notes inf par leur coeff
    tableauNote.inf = tableauNote.inf.*tableauNote.coeff;
    %division des notes inf par la somme des coeffs
    tableauNote.inf = tableauNote.inf./sum(tableauNote.coeff,2);
    
    %multiplication des notes sup par leur coeff
    tableauNote.sup = tableauNote.sup.*tableauNote.coeff;
    %division des notes sup par la somme des coeffs
    tableauNote.sup = tableauNote.sup./sum(tableauNote.coeff,2);
    
    %calcul de la moyenne finale en faisant la somme par ligne
    moyenneInf = sum(tableauNote.inf, 2);
    moyenneSup = sum(tableauNote.sup, 2);
    moyenneMid = (moyenneInf+moyenneSup)./2;
    
    %ajout des tableau de moyenne
    tableauNote = addvars(tableauNote, moyenneInf, moyenneSup, moyenneMid);

end



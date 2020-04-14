%fonction creant les tableaux avec les notes inf et sup
function tableauNote = CalculNotesChiffre(tableauNote, tableauCorrespondance)

    %ligne temporaire
    tableauNote.correspondance(tableauNote.correspondance==0)=1;

    inf = CalculTableauInf(tableauNote.correspondance, tableauCorrespondance.intervalle);
    sup = CalculTableauSup(tableauNote.correspondance, tableauCorrespondance.intervalle);
    
    %ajout des tableaux dans la table principale
    tableauNote = addvars(tableauNote, inf, sup);
end

%creation du tableau contenant les notes inf
function tableauInf = CalculTableauInf(notes, intervalles)
    valeursInf = intervalles(notes, 1);
    tableauInf = reshape(valeursInf, size(notes));
end

%creation du tableau contenant les notes sup
function tableauSup = CalculTableauSup(notes, intervalles)
    valeursSup = intervalles(notes, 2);
    tableauSup = reshape(valeursSup, size(notes));
end
addpath('lib');

%ouverture des fichiers
[tableauNote, tableauCoeff, tableauCorrespondance] = OuvertureFichiers();

%determination des correspondances entre les lettres du excel et les
%lettres de la config
[correspondance, CorrespondanceOK] = CalculCorrespondances(tableauNote.note, tableauCorrespondance.lettre);

%si on a trouvé des lettres non présentes dans la config, on arrete
%{
if (~CorrespondanceOK) 
    return
end
%}

%ajout des correspondances au tableau principal
tableauNote = addvars(tableauNote, correspondance);

%importation des notes inf et sup a partir des correspondances
tableauNote = CalculNotesChiffre(tableauNote, tableauCorrespondance);

%calcul des coefficients par eleve
tableauNote = CalculCoeff(tableauNote, tableauCoeff);

%calcul des moyennes
tableauNote = CalculMoyenne(tableauNote);
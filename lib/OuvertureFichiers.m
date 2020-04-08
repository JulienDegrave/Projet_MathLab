function [tableauNote, tableauCoeff, tableauCorrespondance] = OuvertureFichiers()

    [tableauNote, tableauCoeff] = OuvertureExcel();
    
    tableauCorrespondance = OuvertureConfig();
 
    %{
    disp(tableauNote);
    disp(tableauNote.note);
    disp(tableauCoeff);
    disp(tableauCorrespondance);
    %}
end

function [tableauNote, tableauCoeff] = OuvertureExcel()
    chemin = FenetreOuverture('*.xlsx','Selectionnez le fichier excel de notes');
    
    opts = detectImportOptions(chemin);
    tableauBrut = readtable(chemin,opts);
    
    nom = tableauBrut(4:end,1);
    note = table2array( tableauBrut(4:end,2:end-2) );
    mod = tableauBrut(4:end,end:end);
    
    tableauNote = table(nom, note, mod);
    tableauCoeff = table2array( tableauBrut(1:3,2:end-2) );    
end

function tableauCorrespondance = OuvertureConfig()
    chemin = FenetreOuverture('*.txt','Selectionnez le fichier de correspondance de notes');
    fileID = fopen(chemin , "r");
    
    lettre = split(fgetl(fileID), ";");
    intervalle = cellfun(@(x) str2double(x),split(split(fgetl(fileID), ";"), ","));
    
    fclose(fileID);
    
    tableauCorrespondance = table(lettre, intervalle);
end

function chemin = FenetreOuverture(extension, message)
    [NomFichier,Repertoire] = uigetfile(extension, message);
    chemin = fullfile(Repertoire, NomFichier);
end


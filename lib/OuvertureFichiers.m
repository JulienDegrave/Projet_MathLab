%fonction ouvrant les fichiers et important les fichiers dans des tableaux
%séparés
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

%ouverture du fichier excel
function [tableauNote, tableauCoeff] = OuvertureExcel()
    chemin = FenetreOuverture('*.xlsx','Selectionnez le fichier excel de notes');
    
    %importation du excel avec des detection automatique des contours
    opts = detectImportOptions(chemin);
    tableauBrut = readtable(chemin,opts);
    
    %impoortation des différentes parties du excel
    nom = table2array( tableauBrut(4:end,1) );
    note = table2array( tableauBrut(4:end,2:end-2) );
    mod = table2array( tableauBrut(4:end,end:end) );
    
    tableauNote = table(nom, note, mod);
    tableauCoeff = table2array( tableauBrut(1:3,2:end-2) );    
end

%ouverture du fichier config
function tableauCorrespondance = OuvertureConfig()
    chemin = FenetreOuverture('*.txt','Selectionnez le fichier de correspondance de notes');
    fileID = fopen(chemin , "r");
    
    %separation des valeurs du fichier config
    lettre = split(fgetl(fileID), ";");
    intervalle = cellfun(@(x) str2double(x),split(split(fgetl(fileID), ";"), ","));
    
    fclose(fileID);
    
    %ajout des lettres speciales
    [lettre, intervalle] = AjoutLettresSpeciales(lettre, intervalle);
    
    tableauCorrespondance = table(lettre, intervalle);
end

%ajout des lettres spéciales au tableau de correspondance
function [lettre, intervalle] = AjoutLettresSpeciales(lettre, intervalle)
    lettre{end+1} = ['ABS'];
    intervalle = [intervalle; [0 0]];
    
    lettre{end+1} = ['EXC'];
    intervalle = [intervalle; [NaN NaN]];
end

%affichage d'une fenetre de selection et renvoyant le chemin
function chemin = FenetreOuverture(extension, message)
    [NomFichier,Repertoire] = uigetfile(extension, message);
    chemin = fullfile(Repertoire, NomFichier);
end


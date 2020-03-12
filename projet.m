fileID = fopen("config.txt", "r");
noms_segments = split(fgetl(fileID), ";");
intervalles = cellfun(@(x) str2num(x),split(split(fgetl(fileID), ";"), ","));
fclose(fileID);

disp(mymax(5,8));
pause;

index = find(strcmp(noms_segments, 'C+'));


opts = detectImportOptions('notes_2019_2020.xlsx');
tableauBrut = readtable('notes_2019_2020.xlsx',opts);

nb_notes = 8

nb_eleves = 16
noms_eleves = tableauBrut(4:(nb_eleves+3), 1)

%notes_eleves = table('Size', [nb_eleves,4], 'VariableTypes', repelem("double", 4), 'VariableNames', ["Min", "Mid", "Max", "Note"], 'RowNames', table2array(noms_eleves));

notes_eleves = array2table(zeros(0,4),'VariableNames', {'Min', 'Mid', 'Max', 'Note'});

for eleve = 4:4+nb_eleves
    notes_eleves.Mid(1) = NaN;
    notes_eleves.Min(eleve-3) = 0;
    
    
    for eval = 2:2+nb_notes
        numero_note = find(strcmp(noms_segments, tableauBrut{eleve, eval}));
        disp(numero_note);
        disp(intervalles(numero_note, 1));
        
        
        notes_eleves.Min(eleve-3) = notes_eleves.Min(eleve-3) + intervalles(numero_note, 1);
        notes_eleves.Max(eleve-3) = notes_eleves.Max(eleve-3) + intervalles(numero_note, 2);
        
        disp(notes_eleves);
        pause;
    end
end
%ABS, ATT, EX
%ATT en NaN

function max = mymax(n1,n2)

    max=n1;
    if (n2>max)
        max=n2;
    end
    
end

%fonction calculant les correspondances entre le tableau de notes en
%lettre et le tableau de correspondance des lettres/chiffres
function [correspondance, correspondanceOK] = CalculCorrespondances(notes, lettres)
    %calcul des correspondances
    [~, correspondance] = ismember(notes, lettres);
    
    %test de l'existance de toutes les lettres
    correspondanceOK = TestLettreInconnue(correspondance, notes);
end

%test de l'existance des lettres
function ok = TestLettreInconnue(correspondanceNotes, notes)
    ok = true;
    txt='';
    for row=1:size(correspondanceNotes,1)
        for col=1:size(correspondanceNotes,2)
            if(correspondanceNotes(row,col)==0)
                ok=false;
                txt = sprintf('%sLettre ''%s'' inconnue.\n', txt, notes{row,col});
            end
        end
    end

    if ~strcmp(txt,'')
        msgbox(txt, 'Error','error');
    end
end
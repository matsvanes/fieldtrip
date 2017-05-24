function ft_diary(status, varargin)
% Logs everything that appears in the Matlab Command Window. FT_DIARY makes
% use of Matlab's diary function for this, but it also prints additional
% information at the start, like the function script, input variables and
% Matlab and FieldTrip versions. This function is meant to log with which
% code output files were created.
% Call ft_diary('on') at the start of the function that should be logged,
% and ft_diary('off') at the end.
persistent tmpdiaryname
[ST, ~] = dbstack('-completenames');
workSpace = evalin('caller', 'whos'); % get all the variables from the caller function.

if strcmp(status, 'on')
    if ~exist(fullfile([getenv('HOME'), '/tmp'])) % create a tmp folder in the user's home directory if it is not already exists
        mkdir(fullfile([getenv('HOME'), '/tmp']));
    end
    tmpdiaryname = tempname(fullfile([getenv('HOME'), '/tmp'])) % create a temporary filename for the diary in the user's tmp folder
    diary(tmpdiaryname) % save command window output in a temporary file
    datetime % print date and time
    sprintf('Matlab version %s',version) % print Matlab version
    sprintf('FieldTrip version %s', ft_version) % print fieldtrip version
    
    fname = ST(2).file % full path of caller function
    
    fid = fopen(fname); % open caller function and print all lines
    tline = fgets(fid); % returns first line of fid
    while ischar(tline) % at the end of the script tline=-1
        disp(tline) % display tline
        tline = fgets(fid); % returns the next line of fid
    end
    fclose(fid);
    
    for i = 1:numel(workSpace) % list all workspace variables of the caller function
        try
            [workSpace(i).name, printstruct(evalin('caller', workSpace(i).name))] % list the variable name and its value(s)
        catch
            workSpace(i).name
            sprintf('variable does not have the right format to print') % large variables cannot be printed
        end
    end
    
elseif strcmp(status, 'off')
    % if 'filename' is specified as function argument, give the diary that
    % name. Otherwise, if 'filename' is specified in the caller function,
    % give the diary the same name. else give it the same name as the
    % caller function, with a .txt extension
    
    if any(strcmp(varargin, 'diaryname')) % if diaryname is specified as function argument, take this, but first check if it is valid.
        idx = find(strcmp(varargin, 'diaryname')) + 1;
        [pathstr,name,ext] = fileparts(varargin{idx});
        
        if any(strcmp(varargin, 'extension')) % if extension is specified seperately as function argument, do same checks
            idx2 = find(strcmp(varargin, 'extension')) + 1;
            ext = varargin{idx2};
            [~,~,tmp] = fileparts(ext);
            if isempty(tmp)
                ext = fullfile(['.' ext]);
            end
            if strcmp(ext, '.m') || strcmp(ext, '.mat') % This could potentially override saved output or matlab scripts
                warning('extensions .m and .mat are not supported for diary; diary will be saved as .txt')
                ext = '.txt';
            end
        else
            ext = '.txt';
        end
        diaryname = fullfile([pathstr, '/', name, ext]);
    else
        % look for 'filename' variable in workspace of caller function
        for j=1:numel(workSpace) % Note that this workSpace is usaully different than the one called in ft_diary('on')
            existfilename = strcmp(workSpace(j).name, 'filename');
            if existfilename
                idxname = j;
                break
            end
        end
        if existfilename
            [pathstr,name,ext] = fileparts(evalin('caller', workSpace(idxname).name));
            if any(strcmp(varargin, 'extension')) % if extension is specified seperately as function argument, do same checks
                idx2 = find(strcmp(varargin, 'extension')) + 1;
                ext = varargin{idx2};
                [~,~,tmp] = fileparts(ext);
                if isempty(tmp)
                    ext = fullfile(['.' ext]);
                end
                if strcmp(ext, '.m') || strcmp(ext, '.mat')
                    warning('extensions .m and .mat are not supported for diary; diary will be saved as .txt')
                    ext = '.txt';
                end
            else
                ext = '.txt';
            end
            diaryname = fullfile([pathstr, '/', name, ext]); % make sure the diaryname has the right extension
        else % if no diaryname was specified in caller function or function argument
            diaryname = fullfile([pwd, '/', ST(2).name, '.txt']);  % if the filename
            % of the diary is not specified, save it in current working directory
            % under the name of the caller function, with extension .txt
        end
    end
    
    diary off
    
    % save diary in correct path
    movefile(tmpdiaryname, diaryname);
end
function varargout = partOne(varargin)
% PARTONE MATLAB code for partOne.fig
%      PARTONE, by itself, creates a new PARTONE or raises the existing
%      singleton*.
%
%      H = PARTONE returns the handle to a new PARTONE or the handle to
%      the existing singleton*.
%
%      PARTONE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARTONE.M with the given input arguments.
%
%      PARTONE('Property','Value',...) creates a new PARTONE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before partOne_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to partOne_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help partOne

% Last Modified by GUIDE v2.5 09-May-2017 05:14:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @partOne_OpeningFcn, ...
                   'gui_OutputFcn',  @partOne_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before partOne is made visible.
function partOne_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to partOne (see VARARGIN)

% Choose default command line output for partOne
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes partOne wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.inputEdit3, 'visible', 'off');
set(handles.inputEdit4, 'visible', 'off');
set(handles.inputText3, 'visible', 'off');
set(handles.inputText4, 'visible', 'off');
axes(handles.axes1);
grid on;

% --- Outputs from this function are returned to the command line.
function varargout = partOne_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection editChange in methodSelection.
function methodSelection_Callback(hObject, eventdata, handles)
% hObject    handle to methodSelection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns methodSelection contents as cell array
%        contents{get(hObject,'Value')} returns selected item from methodSelection
global editChange;
editChange = 1;
set(handles.inputEdit1, 'visible', 'off');
set(handles.inputEdit2, 'visible', 'off');
set(handles.inputEdit3, 'visible', 'off');
set(handles.inputEdit4, 'visible', 'off');
set(handles.inputText1, 'visible', 'off');
set(handles.inputText2, 'visible', 'off');
set(handles.inputText3, 'visible', 'off');
set(handles.inputText4, 'visible', 'off');
set(handles.StepButton, 'visible', 'on');
set(handles.uipanel2, 'visible', 'on');
set(handles.axes2, 'visible', 'off');
contents = cellstr(get(hObject,'String'));
selection = contents{get(handles.methodSelection, 'Value')};
if (strcmpi(selection,'Bisection') || strcmpi(selection,'False-position'))
    set(handles.inputText1, 'string', 'Lower bound :');
    set(handles.inputText2, 'string', 'Upper bound :');
    set(handles.inputEdit1, 'visible', 'on');
    set(handles.inputEdit2, 'visible', 'on');
    set(handles.inputText1, 'visible', 'on');
    set(handles.inputText2, 'visible', 'on');
elseif (strcmpi(selection,'Fixed point') || strcmpi(selection,'Newton-Raphson'))
    set(handles.inputText1, 'string', 'Initial point :');
    set(handles.inputEdit1, 'visible', 'on');
    set(handles.inputText1, 'visible', 'on');
elseif (strcmpi(selection,'Secant'))
    set(handles.inputText1, 'string', 'First Initial point :');
    set(handles.inputText2, 'string', 'Second Initial point :');
    set(handles.inputEdit1, 'visible', 'on');
    set(handles.inputEdit2, 'visible', 'on');
    set(handles.inputText1, 'visible', 'on');
    set(handles.inputText2, 'visible', 'on');
elseif (strcmpi(selection, 'Bierge-Vieta'))
    set(handles.inputText1, 'string', 'Initial point :');
    set(handles.inputEdit1, 'visible', 'on');
    set(handles.inputText1, 'visible', 'on');
    set(handles.StepButton, 'visible', 'off');
elseif (strcmpi(selection, 'General'))
    set(handles.StepButton, 'visible', 'off');
elseif (strcmpi(selection,'All methods'))
    set(handles.inputText1, 'string', 'Lower bound :');
    set(handles.inputText2, 'string', 'Upper bound :');
    set(handles.inputEdit1, 'visible', 'on');
    set(handles.inputEdit2, 'visible', 'on');
    set(handles.inputText1, 'visible', 'on');
    set(handles.inputText2, 'visible', 'on');
    set(handles.inputText3, 'string', 'First Initial point :');
    set(handles.inputText4, 'string', 'Second Initial point :');
    set(handles.inputEdit3, 'visible', 'on');
    set(handles.inputEdit4, 'visible', 'on');
    set(handles.inputText3, 'visible', 'on');
    set(handles.inputText4, 'visible', 'on');
    set(handles.StepButton, 'visible', 'off');
    set(handles.uipanel2, 'visible', 'off');
    set(handles.axes2, 'visible', 'on');
    axes(handles.axes2);
    grid on;
    axes(handles.axes1);
end

% --- Executes during object creation, after setting all properties.
function methodSelection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to methodSelection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function maxIterationEdit_Callback(hObject, eventdata, handles)
% hObject    handle to maxIterationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxIterationEdit as text
%        str2double(get(hObject,'String')) returns contents of maxIterationEdit as a double
global editChange;
editChange = 1;

% --- Executes during object creation, after setting all properties.
function maxIterationEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxIterationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function epsilonEdit_Callback(hObject, eventdata, handles)
% hObject    handle to epsilonEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsilonEdit as text
%        str2double(get(hObject,'String')) returns contents of epsilonEdit as a double
global editChange;
editChange = 1;

% --- Executes during object creation, after setting all properties.
function epsilonEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilonEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function equationEdit_Callback(hObject, eventdata, handles)
% hObject    handle to equationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of equationEdit as text
%        str2double(get(hObject,'String')) returns contents of equationEdit as a double
global editChange;
editChange = 1;

% --- Executes during object creation, after setting all properties.
function equationEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in loadInputButton.
function loadInputButton_Callback(hObject, eventdata, handles)
% hObject    handle to loadInputButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global editChange;
editChange = 1;
[filename, pathname] = uigetfile({'*.txt', 'Text files (*.txt)'},'Select text file to load');
if (isequal(filename, 0) || isequal(pathname, 0))
   return; 
end
[method, equ, acc, iter, in1, in2, in3, in4, errFlag, errMessage]  = readEquationFile(strcat(pathname, filename));
if (errFlag)
    msgbox(strcat('Error : ', errMessage),'Error','error');
else
    try
        f = inline(equ,'x');
        f(0);
    catch
        msgbox('Invalid function. Must be a valid f(x) function', 'Error','error');
        return;
    end
    contents = cellstr(get(handles.methodSelection,'String'));
    [n, ~] = size(contents);
    for i = 1:n
        if (strcmpi(method, contents{i}))
           set(handles.methodSelection, 'Value', i);
          break;
        end
    end
    set(handles.inputEdit1, 'string', in1);
    set(handles.inputEdit2, 'string', in2);
    set(handles.inputEdit3, 'string', in3);
    set(handles.inputEdit4, 'string', in4);
    set(handles.equationEdit, 'string', equ);
    set(handles.maxIterationEdit, 'string', iter);
    set(handles.epsilonEdit, 'string', acc);
    methodSelection_Callback(handles.methodSelection, eventdata, handles);
end

% --- Executes on button press in SolveButton.
function SolveButton_Callback(hObject, eventdata, handles)
% hObject    handle to SolveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global editChange;
    editChange = 1;
    equ = get(handles.equationEdit ,'string');
    contents = cellstr(get(handles.methodSelection,'String'));
    selection = contents{get(handles.methodSelection, 'Value')};
    acc = str2double(get(handles.epsilonEdit, 'string'));
    set(handles.outputIteration,'string', strcat('Number of iterations : ', 'Undefined'));
    set(handles.outputExecution,'string', strcat('Execution time : ', 'Undefined'));
    set(handles.outputRoot, 'string', strcat('Approximate root : ', 'Undefined'));
    set(handles.outputTable,'Data', {});
    try
        f = inline(equ, 'x');
        f(0);
    catch
        msgbox('Invalid function. Must be a valid f(x) function', 'Error','error');
        return;
    end
    if (isnan(acc))
        acc = 0.00001;
        set(handles.epsilonEdit, 'string', '0.00001');
    end;
    iter = str2double(get(handles.maxIterationEdit, 'String'));
    if (isnan(iter) || floor(iter) ~= iter)
        iter = 50;
        set(handles.maxIterationEdit, 'string', '50');
    end;
    if (strcmp(selection,'Bisection'))
        xl = str2double(get(handles.inputEdit1, 'string'));
        xu = str2double(get(handles.inputEdit2, 'string'));
        if (isnan(xl) || isnan(xu))
            msgbox('Invalid Value', 'Error','error');
        else
            tic;
            [~, ~, rl, erl, frl, flag] = bisectionMethod(f, xl, xu, acc, iter);
            time = toc;
            if (flag)
                msgbox('Error during bisection. F(xl)*F(xu) > 0 in an iteration','Error','error');
            else
                if (xl < xu)
                    l = xl - (xu - xl) / 10 - 1;
                    u = xu + (xu - xl) / 10 + 1;
                else
                    l = xu - (xl - xu) / 10 - 1;
                    u = xl + (xl - xu) / 10 + 1;
                end
                fplot(f, [l, u], 'k');
                xr = rl(end);
                hold on;
                y1=get(gca,'ylim');
                plot([xl xl],y1,'r');
                plot([xu xu],y1,'b');
                plot([xr xr],y1,'y');
                hold off;
                title('Plot of the function with other auxillary functions');
                xlabel('x');
                ylabel('y');
                legend('f(x)', 'lower bound', 'upper bound', 'approximate root');
                [~, tempn] = size(rl);
                set(handles.outputIteration,'string', strcat('Number of iterations : ', int2str(tempn)));
                set(handles.outputExecution,'string', strcat('Execution time : ', num2str(time)));
                set(handles.outputRoot, 'string', strcat('Approximate root : ', num2str(xr)));
                newData = {rl(1), frl(1), ''};
                i = 2;
                while (i <= tempn)
                    newData = [newData; {rl(i), frl(i), erl(i)}];
                    i = i + 1;
                end;
                set(handles.outputTable,'Data',newData);
            end
        end;
    elseif (strcmp(selection,'False-position'))
        xl = str2double(get(handles.inputEdit1, 'string'));
        xu = str2double(get(handles.inputEdit2, 'string'));
        if (isnan(xl) || isnan(xu))
            msgbox('Invalid Value', 'Error','error');
        else
            tic;
            [~, ~, rl, erl, frl, flag] = falsePosition(f, xl, xu, acc, iter);
            time = toc;
            if (flag)
                msgbox('Error! f(xl) * f(xu) > 0 in an iteration', 'Error','error');
            else
                if (xl < xu)
                    l = xl - (xu - xl) / 10 - 1;
                    u = xu + (xu - xl) / 10 + 1;
                else
                    l = xu - (xl - xu) / 10 - 1;
                    u = xl + (xl - xu) / 10 + 1;
                end
                fplot(f, [l, u], 'k');
                xr = rl(end);
                hold on;
                y1=get(gca,'ylim');
                plot([xl xl],y1,'r');
                plot([xu xu],y1,'b');
                plot([xr xr],y1,'y');
                title('Plot of the function with other auxillary functions');
                xlabel('x');
                ylabel('y');
                legend('f(x)', 'lower bound', 'upper bound', 'approximate root');
                hold off;
                [~, tempn] = size(rl);
                set(handles.outputIteration,'string', strcat('Number of iterations : ', int2str(tempn)));
                set(handles.outputExecution,'string', strcat('Execution time : ', num2str(time)));
                set(handles.outputRoot, 'string', strcat('Approximate root : ', num2str(xr)));
                newData = {rl(1), frl(1), ''};
                i = 2;
                while (i <= tempn)
                    newData = [newData; {rl(i), frl(i), erl(i)}];
                    i = i + 1;
                end;
                set(handles.outputTable,'Data',newData);
            end
        end;
    elseif (strcmp(selection,'Fixed point'))
        x0 = str2double(get(handles.inputEdit1, 'string'));
        if (isnan(x0))
            msgbox('Invalid Value', 'Error','error');
        else
            g = @(x) f(x) + x;
            line = @(x) x;
            tic;
            [rl, erl, frl] = fixedPoint(f, g, x0, acc, iter);
            time = toc;
            xr = rl(end);
            if (x0 < xr)
                l = x0 - (xr - x0) / 10 - 1;
                u = xr + (xr - x0) / 10 + 1;
            else
                l = xr - (x0 - xr) / 10 - 1;
                u = x0 + (x0 - xr) / 10 + 1;
            end
            fplot(f, [l, u], 'k');
            hold on;
            fplot(g, [l, u], 'b');
            fplot(line, [l, u],'g');
            y1=get(gca,'ylim');
            plot([x0 x0],y1,'r');
            plot([xr xr],y1,'y');
            title('Plot of the function with other auxillary functions');
            xlabel('x');
            ylabel('y');
            legend('f(x)', 'g(x)', 'y(x) = x',  'initial point', 'approximate root');
            hold off;
            [~, tempn] = size(rl);
            set(handles.outputIteration,'string', strcat('Number of iterations : ', int2str(tempn)));
            set(handles.outputExecution,'string', strcat('Execution time : ', num2str(time)));
            set(handles.outputRoot, 'string', strcat('Approximate root : ', num2str(xr)));
            newData = {rl(1), frl(1), ''};
            i = 2;
            while (i <= tempn)
                newData = [newData; {rl(i), frl(i), erl(i)}];
                i = i + 1;
            end;
            set(handles.outputTable,'Data',newData);
        end;
    elseif (strcmp(selection,'Newton-Raphson'))
        x0 = str2double(get(handles.inputEdit1, 'string'));
        if (isnan(x0))
            msgbox('Invalid Value', 'Error','error');
        else
            syms x;
            df = inline(diff(sym(equ)), 'x');
            tic;
            [rl, erl, frl, ~, flag, message] = newtonRaphson(f,df,x0,acc,iter);
            time = toc;
            if (flag)
               msgbox(strcat('Error in process : ',message), 'Error', 'error'); 
            else
                xr = rl(end);
                if (x0 < xr)
                    l = x0 - (xr - x0) / 10 - 1;
                    u = xr + (xr - x0) / 10 + 1;
                else
                    l = xr - (x0 - xr) / 10 - 1;
                    u = x0 + (x0 - xr) / 10 + 1;
                end
                fplot(f, [l, u], 'k');
                hold on;
                fplot(df, [l, u], 'b');
                y1=get(gca,'ylim');
                plot([x0 x0],y1,'r');
                plot([xr xr],y1,'y');
                title('Plot of the function with other auxillary functions');
                xlabel('x');
                ylabel('y');
                legend('f(x)', 'f"(x)', 'initial point', 'approximate root');
                hold off;
                [~, tempn] = size(rl);
                set(handles.outputIteration,'string', strcat('Number of iterations : ', int2str(tempn)));
                set(handles.outputExecution,'string', strcat('Execution time : ', num2str(time)));
                set(handles.outputRoot, 'string', strcat('Approximate root : ', num2str(xr)));
                newData = {rl(1), frl(1), ''};
                i = 2;
                while (i <= tempn)
                    newData = [newData; {rl(i), frl(i), erl(i)}];
                    i = i + 1;
                end;
                set(handles.outputTable,'Data',newData);
            end
        end;
    elseif (strcmp(selection,'Bierge-Vieta'))
    elseif (strcmp(selection,'Secant'))
        x0 = str2double(get(handles.inputEdit1, 'string'));
        x1 = str2double(get(handles.inputEdit2, 'string'));
        if (isnan(x0) || isnan(x1) || x0 == x1)
            msgbox('Invalid Value', 'Error','error');
        else
            tic;
            [~, rl, ~, frl, erl] = secant(f, x0, x1, acc, iter);
            time = toc;
            syms x;
            df = inline(diff(sym(equ)), 'x');
            xr = rl(end);
            if (x0 < xr)
                l = x0 - (xr - x0) / 10 - 1;
                u = xr + (xr - x0) / 10 + 1;
            else
                l = xr - (x0 - xr) / 10 - 1;
                u = x0 + (x0 - xr) / 10 + 1;
            end
            fplot(f, [l, u], 'k');
            hold on;
            fplot(df, [l, u], 'g');
            y1=get(gca,'ylim');
            plot([x0 x0],y1,'r');
            plot([x1 x1],y1,'b');
            plot([xr xr],y1,'y');
            title('Plot of the function with other auxillary functions');
            xlabel('x');
            ylabel('y');
            legend('f(x)', 'f"(x)', 'first initial point', 'second initial point', 'approximate root');    
            hold off;
            [~, tempn] = size(rl);
            set(handles.outputIteration,'string', strcat('Number of iterations : ', int2str(tempn)));
            set(handles.outputExecution,'string', strcat('Execution time : ', num2str(time)));
            set(handles.outputRoot, 'string', strcat('Approximate root : ', num2str(xr)));
            newData = {rl(1), frl(1), ''};
            i = 2;
            while (i <= tempn)
                newData = [newData; {rl(i), frl(i), erl(i)}];
                i = i + 1;
            end;
            set(handles.outputTable,'Data',newData);
        end;
    elseif (strcmp(selection,'All methods'))
        xl = str2double(get(handles.inputEdit1, 'string'));
        xu = str2double(get(handles.inputEdit2, 'string'));
        x0 = str2double(get(handles.inputEdit3, 'string'));
        x1 = str2double(get(handles.inputEdit4, 'string'));
        if (isnan(x0) || isnan(x1) || x0 == x1 || isnan(xl) || isnan(xu) || xl == xu)
            msgbox('Invalid Inputs !', 'Error','error');
        else
            [~, ~, rl, ~, ~, flag] = bisectionMethod(f, xl, xu, acc, iter);
            if (flag)
                msgbox('Error during bisection. F(xl)*F(xu) > 0 in an iteration','Error','error');
                plot(0, 0, 'r');
            else
                [~, tempn] = size(rl);
                iterM = zeros(tempn, 1);
                for i = 1:tempn
                    iterM(i) = i;
                end
                plot(iterM, rl, 'r');
            end
            hold on;
            [~, ~, rl, ~, ~, flag] = falsePosition(f, xl, xu, acc, iter);
            if (flag)
                msgbox('Error during false position! f(xl) * f(xu) > 0 in an iteration', 'Error','error');
                plot(0, 0, 'b');
            else
                [~, tempn] = size(rl);
                iterM = zeros(tempn, 1);
                for i = 1:tempn
                    iterM(i) = i;
                end
                plot(iterM, rl, 'b');
            end
            g = @(x) f(x) + x;
            [rl, ~, ~] = fixedPoint(f, g, x0, acc, iter);
            [~, tempn] = size(rl);
            iterM = zeros(tempn, 1);
            for i = 1:tempn
                iterM(i) = i;
            end
            plot(iterM, rl, 'g');
            syms x;
            df = inline(diff(sym(equ)), 'x');
            [rl, ~, ~, ~, flag, message] = newtonRaphson(f,df,x0,acc,iter);
            if (flag)
               msgbox(strcat('Error in newton-Raphson process : ',message), 'Error', 'error');
               plot(0, 0, 'k');
            else
                [~, tempn] = size(rl);
                iterM = zeros(tempn, 1);
                for i = 1:tempn
                    iterM(i) = i;
                end
                plot(iterM, rl, 'k');
            end
            [~, rl, ~, ~, ~] = secant(f, x0, x1, acc, iter);
            [~, tempn] = size(rl);
            iterM = zeros(tempn, 1);
            for i = 1:tempn
                iterM(i) = i;
            end
            plot(iterM, rl, 'y');
            title('Plot of approximate root in each iteration for different methods');
            xlabel('iteration');
            ylabel('Xr');
            legend('bisection', 'false-position', 'fixed point', 'Newton-Rhapson', 'Secant'); 
            hold off;
        end
    elseif (strcmp(selection,'General'))
    end
    grid on;


% --- Executes on button press in StepButton.
function StepButton_Callback(hObject, eventdata, handles)
% hObject    handle to StepButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global editChange;
global counter;
if (editChange == 1)
    set(handles.outputIteration,'string', strcat('Number of iterations : ', 'Undefined'));
    set(handles.outputExecution,'string', strcat('Execution time : ', 'Undefined'));
    set(handles.outputRoot, 'string', strcat('Approximate root : ', 'Undefined'));
    set(handles.outputTable,'Data', {});
   editChange = 0;
   counter = 1;
end
contents = cellstr(get(handles.methodSelection,'String'));
selection = contents{get(handles.methodSelection, 'Value')};
equ = get(handles.equationEdit ,'string');
try
    f = inline(equ,'x');
    f(0);
catch
    msgbox('Invalid function. Must be a valid f(x) function', 'Error','error');
    return;
end
acc = str2double(get(handles.epsilonEdit, 'string'));
if (isnan(acc))
    acc = 0.00001;
    set(handles.epsilonEdit, 'string', '0.00001');
end;
iter = str2double(get(handles.maxIterationEdit, 'String'));
if (isnan(iter))
    iter = 50;
    set(handles.maxIterationEdit, 'string', '50');
end;

if (strcmp(selection,'Bisection'))
    xl = str2double(get(handles.inputEdit1, 'string'));
    xu = str2double(get(handles.inputEdit2, 'string'));
    if (isnan(xl) || isnan(xu))
        msgbox('Invalid Value', 'Error','error');
    else
        tic;
        [ll, ul, rl, erl, frl, flag] = bisectionMethod(f, xl, xu, acc, iter);
        time = toc;
        if (flag)
            msgbox('Error during bisection. F(xl)*F(xu) > 0 in an iteration','Error','error');
        else
            [~, tempn] = size(ll);
            if (counter <= tempn)
                set(handles.outputIteration,'string', strcat('Number of iterations : ', int2str(counter)));
                l = min([xl xu]);
                u = max([xl xu]);
                l = l - (u - l) / 10 - 1;
                u = u + (u - l) / 10 + 1;
                fplot(f, [l, u], 'k');
                hold on;
                y1=get(gca,'ylim');
                plot([ll(counter) ll(counter)],y1,'r');
                plot([ul(counter) ul(counter)],y1,'b');
                plot([rl(counter) rl(counter)],y1,'y');
                title('Plot of the function with other auxillary functions');
                xlabel('x');
                ylabel('y');
                legend('f(x)', 'lower bound', 'upper bound', 'approximate root');
                hold off;
                newData = get(handles.outputTable, 'Data');
                if (counter == 1)
                    newData = [newData; {rl(counter), frl(counter), ''}];
                else
                    newData = [newData; {rl(counter), frl(counter), erl(counter)}];
                end;
                set(handles.outputTable,'Data', newData);
                counter = counter + 1;
            end
            if (counter == tempn + 1)
                set(handles.outputExecution,'string', strcat('Execution time : ', num2str(time)));
                set(handles.outputRoot, 'string', strcat('Approximate root : ', num2str(rl(end))));
            end
        end
    end
elseif (strcmp(selection,'False-position'))
    xl = str2double(get(handles.inputEdit1, 'string'));
    xu = str2double(get(handles.inputEdit2, 'string'));
    if (isnan(xl) || isnan(xu))
        msgbox('Invalid Value', 'Error','error');
    else
        tic;
        [ll, ul, rl, erl, frl, flag] = falsePosition(f, xl, xu, acc, iter);
        time = toc;
        if (flag)
            msgbox('Error! f(xl) * f(xu) > 0 in an iteration', 'Error','error');
        else
            [~, tempn] = size(ll);
            if (counter <= tempn)
                set(handles.outputIteration,'string', strcat('Number of iterations : ', int2str(counter)));
                l = min([xl xu]);
                u = max([xl xu]);
                l = l - (u - l) / 10 - 1;
                u = u + (u - l) / 10 + 1;
                fplot(f, [l, u], 'k');
                hold on;
                y1=get(gca,'ylim');
                plot([ll(counter) ll(counter)],y1,'r');
                plot([ul(counter) ul(counter)],y1,'b');
                plot([rl(counter) rl(counter)],y1,'y');
                plot([ll(counter), ul(counter)], [f(ll(counter)), f(ul(counter))], 'g');
                title('Plot of the function with other auxillary functions');
                xlabel('x');
                ylabel('y');
                legend('f(x)', 'lower bound', 'upper bound', 'approximate root', 'line between Xl & Xu');
                hold off;
                newData = get(handles.outputTable, 'Data');
                if (counter == 1)
                    newData = [newData; {rl(counter), frl(counter), ''}];
                else
                    newData = [newData; {rl(counter), frl(counter), erl(counter)}];
                end;
                set(handles.outputTable,'Data', newData);
                counter = counter + 1;
            end
            if (counter == tempn + 1)
                set(handles.outputExecution,'string', strcat('Execution time : ', num2str(time)));
                set(handles.outputRoot, 'string', strcat('Approximate root : ', num2str(rl(end))));
            end
        end
    end
elseif (strcmp(selection,'Fixed point'))
    x0 = str2double(get(handles.inputEdit1, 'string'));
    if (isnan(x0))
        msgbox('Invalid Value', 'Error','error');
    else
        g = @(x) f(x) + x;
        line = @(x) x;
        tic;
        [rl, erl, frl] = fixedPoint(f, g, x0, acc, iter);
        time = toc;
        [~, tempn] = size(rl);
        if (counter <= tempn)
            set(handles.outputIteration,'string', strcat('Number of iterations : ', int2str(counter)));
            xr = rl(counter);
            xmin = min([x0 xr]);
            xmax = max([x0 xr]);
            if (counter > 1)
                x0 = rl (counter - 1);
                xmin = min([xmin x0]);
                xmax = max([xmax x0]);
            end
            l = xmin - (xmax - xmin) / 10 - 1;
            u = xmax + (xmax - xmin) / 10 + 1;
            fplot(f, [l, u], 'k');
            hold on;
            fplot(g, [l, u], 'b');
            fplot(line, [l, u],'g');
            y1=get(gca,'ylim');
            plot([x0 x0],y1,'r');
            plot([rl(counter) rl(counter)],y1,'y');
            title('Plot of the function with other auxillary functions');
            xlabel('x');
            ylabel('y');
            legend('f(x)', 'g(x)', 'y(x) = x', 'initial point', 'approximate root');    
            hold off;
            newData = get(handles.outputTable, 'Data');
            if (counter == 1)
                newData = [newData; {rl(counter), frl(counter), ''}];
            else
                newData = [newData; {rl(counter), frl(counter), erl(counter)}];
            end;
            set(handles.outputTable,'Data', newData);
            counter = counter + 1;
       end
       if (counter == tempn + 1)
            set(handles.outputExecution,'string', strcat('Execution time : ', num2str(time)));
            set(handles.outputRoot, 'string', strcat('Approximate root : ', num2str(rl(end))));
       end
    end;
elseif (strcmp(selection,'Newton-Raphson'))
     x0 = str2double(get(handles.inputEdit1, 'string'));
    if (isnan(x0))
        msgbox('Invalid Value', 'Error','error');
    else
       syms x;
        df = inline(diff(sym(equ)), 'x');
        tic;
        [rl, erl, frl, ~, flag, message] = newtonRaphson(f,df,x0,acc,iter);
        time = toc;
        if (flag)
           msgbox(strcat('Error in process : ',message), 'Error', 'error');
        else
            [~, tempn] = size(rl);
            if (counter <= tempn)
                set(handles.outputIteration,'string', strcat('Number of iterations : ', int2str(counter)));
                xr = rl(counter);
                xmin = min([x0 xr]);
                xmax = max([x0 xr]);
                if (counter > 1)
                    x0 = rl (counter - 1);
                    xmin = min([xmin x0]);
                    xmax = max([xmax x0]);
                end
                l = xmin - (xmax - xmin) / 10 - 1;
                u = xmax + (xmax - xmin) / 10 + 1;
                fplot(f, [l, u], 'k');
                hold on;
                fplot(df, [l, u], 'b');
                if (counter > 1)
                    tangF = @(x)df(rl(counter - 1))*(x - rl(counter - 1)) + f(rl(counter - 1));
                    fplot(tangF, [l, u], 'g');
                end
                y1=get(gca,'ylim');
                plot([x0 x0],y1,'r');
                plot([xr xr],y1,'y');
                title('Plot of the function with other auxillary functions');
                xlabel('x');
                ylabel('y');
                if (couner == 1)
                    legend('f(x)', 'f"(x)', 'initial point', 'approximate root');
                else
                    legend('f(x)', 'f"(x)', 'tangent at initial point', 'initial point', 'approximate root');
                end
                hold off;
                newData = get(handles.outputTable, 'Data');
                if (counter == 1)
                    newData = [newData; {rl(counter), frl(counter), ''}];
                else
                    newData = [newData; {rl(counter), frl(counter), erl(counter)}];
                end;
                set(handles.outputTable,'Data', newData);
                counter = counter + 1;
           end
           if (counter == tempn + 1)
                set(handles.outputExecution,'string', strcat('Execution time : ', num2str(time)));
                set(handles.outputRoot, 'string', strcat('Approximate root : ', num2str(rl(end))));
           end
        end
    end;
elseif (strcmp(selection,'Bierge-Vieta'))
elseif (strcmp(selection,'Secant'))
     x0 = str2double(get(handles.inputEdit1, 'string'));
     x1 = str2double(get(handles.inputEdit2, 'string'));
    if (isnan(x0) || isnan(x1) ||x1 == x0)
        msgbox('Invalid Value', 'Error','error');
    else
        tic;
        [~, rl, ~, frl, erl] = secant(f, x0, x1, acc, iter);
        time = toc;
        [~, tempn] = size(rl);
        if (counter <= tempn)
            set(handles.outputIteration,'string', strcat('Number of iterations : ', int2str(counter)));
            xr = rl(counter);
            xmin = min([x0 x1 xr]);
            xmax = max([x0 x1 xr]);
            if (counter > 1)
                x1 = rl(counter - 1);
                xmin = min([xmin rl(counter - 1)]);
                xmax = max([xmax rl(counter - 1)]);
            end
            if (counter > 2)
                x0 = rl(counter -2);
                xmin = min([xmin rl(counter - 2)]);
                xmax = max([xmax rl(counter - 2)]);
            end
            l = xmin - (xmax - xmin) / 10 - 1;
            u = xmax + (xmax - xmin) / 10 + 1;
            fplot(f, [l, u], 'k');
            hold on;
            if (counter > 1)
                tempF = @(x) ((f(x1) - f(x0)) / (x1 - x0))* (x - x1) + f(x1);
                fplot(tempF, [l, u], 'g');
            end
            y1=get(gca,'ylim');
            plot([x1 x1], y1, 'b');
            plot([x0 x0], y1, 'r');
            plot([xr xr], y1, 'y');
            title('Plot of the function with other auxillary functions');
            xlabel('x');
            ylabel('y');
            if (counter == 1)
                legend('f(x)', 'second initial point', 'first initial point', 'approximate root');
            else
                legend('f(x)', 'line between x0 & x1', 'second initial point', 'first initial point', 'approximate root');
            end
            hold off;
            newData = get(handles.outputTable, 'Data');
            newData = [newData; {rl(counter), frl(counter), erl(counter)}];
            set(handles.outputTable,'Data', newData);
            counter = counter + 1;
       end
       if (counter == tempn + 1)
            set(handles.outputExecution,'string', strcat('Execution time : ', num2str(time)));
            set(handles.outputRoot, 'string', strcat('Approximate root : ', num2str(rl(end))));
       end
    end;
elseif (strcmp(selection,'All methodes'))
elseif (strcmp(selection,'General'))
end
grid on;

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function inputEdit1_Callback(hObject, eventdata, handles)
% hObject    handle to inputEdit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputEdit1 as text
%        str2double(get(hObject,'String')) returns contents of inputEdit1 as a double
global editChange;
editChange = 1;

% --- Executes during object creation, after setting all properties.
function inputEdit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputEdit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputEdit2_Callback(hObject, eventdata, handles)
% hObject    handle to inputEdit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputEdit2 as text
%        str2double(get(hObject,'String')) returns contents of inputEdit2 as a double
global editChange;
editChange = 1;

% --- Executes during object creation, after setting all properties.
function inputEdit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputEdit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputEdit3_Callback(hObject, eventdata, handles)
% hObject    handle to inputEdit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputEdit3 as text
%        str2double(get(hObject,'String')) returns contents of inputEdit3 as a double
global editChange;
editChange = 1;

% --- Executes during object creation, after setting all properties.
function inputEdit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputEdit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function inputEdit4_Callback(hObject, eventdata, handles)
% hObject    handle to inputEdit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputEdit4 as text
%        str2double(get(hObject,'String')) returns contents of inputEdit4 as a double
global editChange;
editChange = 1;

% --- Executes during object creation, after setting all properties.
function inputEdit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputEdit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global editChange;
global counter;
editChange = 1;
counter = 1;


% --- Executes on button press in solveSave.
function solveSave_Callback(hObject, eventdata, handles)
% hObject    handle to solveSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global editChange;
    editChange = 1;
    [filename, pathname] = uiputfile({'*.txt', 'Text files (*.txt)'},'Select text file to load');
    if (isequal(filename, 0) || isequal(pathname, 0))
       return; 
    end
    filename = strcat(pathname, filename);
    equ = get(handles.equationEdit ,'string');
    contents = cellstr(get(handles.methodSelection,'String'));
    selection = contents{get(handles.methodSelection, 'Value')};
    acc = str2double(get(handles.epsilonEdit, 'string'));
    SolveButton_Callback(handles.SolveButton, eventdata, handles);
    status = 'Not a valid function';
    xr = 'Undefined';
    time = 'Undefined';
    method = selection;
    override = 1;
    rl = [];
    frl = [];
    erl = [];
    try
        f = inline(equ,'x');
        f(0);
    catch
        iter = 'Undefined';
        status = 'Not a valid function';
        xr = 'Undefined';
        time = 'Undefined';
        rl = [];
        frl = [];
        erl = [];
        writeToFile(filename , iter, xr, method, time, status, rl, frl, erl, override);
        return;
    end
    if (isnan(acc))
        acc = 0.00001;
        set(handles.epsilonEdit, 'string', '0.00001');
    end;
    iter = str2double(get(handles.maxIterationEdit, 'String'));
    if (isnan(iter) || floor(iter) ~= iter)
        iter = 50;
        set(handles.maxIterationEdit, 'string', '50');
    end;
    if (strcmp(selection,'Bisection'))
        xl = str2double(get(handles.inputEdit1, 'string'));
        xu = str2double(get(handles.inputEdit2, 'string'));
        if (isnan(xl) || isnan(xu))
            iter = 'Undefined';
            status = 'Error ! Non-valid bounds';
            xr = 'Undefined';
            time = 'Undefined';
        else
            tic;
            [~, ~, rl, erl, frl, flag] = bisectionMethod(f, xl, xu, acc, iter);
            time = toc;
            if (flag)
                iter = 'Undefined';
                status = 'Error ! F(Xl) * F(Xu) > 0';
                xr = 'Undefined';
                time = 'Undefined';
            else
                [~, iter] = size(rl);
                 xr = num2str(rl(end));
                 time = num2str(time);
                 iter = num2str(iter);
                 status = 'Run successfully';
            end
        end;
    elseif (strcmp(selection,'False-position'))
        xl = str2double(get(handles.inputEdit1, 'string'));
        xu = str2double(get(handles.inputEdit2, 'string'));
        if (isnan(xl) || isnan(xu))
            iter = 'Undefined';
            status = 'Error ! Non-valid bounds';
            xr = 'Undefined';
            time = 'Undefined';
        else
            tic;
            [~, ~, rl, erl, frl, flag] = falsePosition(f, xl, xu, acc, iter);
            time = toc;
            if (flag)
                iter = 'Undefined';
                status = 'Error! F(Xu) * F(Xl) > 0';
                xr = 'Undefined';
                time = 'Undefined';
            else    
                [~, iter] = size(rl);
                 xr = num2str(rl(end));
                 time = num2str(time);
                 iter = num2str(iter);
                 status = 'Run successfully';
            end
        end;
    elseif (strcmp(selection,'Fixed point'))
        x0 = str2double(get(handles.inputEdit1, 'string'));
        if (isnan(x0))
            iter = 'Undefined';
            status = 'Error ! Non-valid initial point';
            xr = 'Undefined';
            time = 'Undefined';
        else
            g = @(x) f(x) + x;
            tic;
            [rl, erl, frl] = fixedPoint(f, g, x0, acc, iter);
            time = toc;
            [~, iter] = size(rl);
            xr = num2str(rl(end));
             time = num2str(time);
             iter = num2str(iter);
             status = 'Run successfully';
        end;
    elseif (strcmp(selection,'Newton-Raphson'))
        x0 = str2double(get(handles.inputEdit1, 'string'));
        if (isnan(x0))
            iter = 'Undefined';
            status = 'Error ! Non-valid initial point';
            xr = 'Undefined';
            time = 'Undefined';
        else
            syms x;
            df = inline(diff(sym(equ)), 'x');
            tic;
            [rl, erl, frl, ~, flag, message] = newtonRaphson(f,df,x0,acc,iter);
            time = toc;
            if (flag)
               iter = 'Undefined';
                status = message;
                xr = 'Undefined';
                time = 'Undefined';
            else
                [~, iter] = size(rl);
                xr = num2str(rl(end));
                 time = num2str(time);
                 iter = num2str(iter);
                 status = 'Run successfully';
            end
        end;
    elseif (strcmp(selection,'Bierge-Vieta'))
    elseif (strcmp(selection,'Secant'))
        x0 = str2double(get(handles.inputEdit1, 'string'));
        x1 = str2double(get(handles.inputEdit2, 'string'));
        if (isnan(x0) || isnan(x1) || x0 == x1)
            iter = 'Undefined';
            status = 'Error ! Non-valid bounds';
            xr = 'Undefined';
            time = 'Undefined';
        else
            tic;
            [~, rl, ~, frl, erl] = secant(f, x0, x1, acc, iter);
            time = toc;
            xr = num2str(rl(end));
            [~, iter] = size(rl);
             time = num2str(time);
             iter = num2str(iter);
             status = 'Run successfully';
        end;
    elseif (strcmp(selection,'All methods'))
        xl = str2double(get(handles.inputEdit1, 'string'));
        xu = str2double(get(handles.inputEdit2, 'string'));
        x0 = str2double(get(handles.inputEdit3, 'string'));
        x1 = str2double(get(handles.inputEdit4, 'string'));
        maxIter = iter;
        method = 'bisection';
        if (isnan(xl) || isnan(xu))
            iter = 'Undefined';
            status = 'Error ! Non-valid bounds';
            xr = 'Undefined';
            time = 'Undefined';
        else
            tic;
            [~, ~, rl, erl, frl, flag] = bisectionMethod(f, xl, xu, acc, maxIter);
            time = toc;
            if (flag)
                iter = 'Undefined';
                status = 'Error ! F(Xl) * F(Xu) > 0';
                xr = 'Undefined';
                time = 'Undefined';
            else
                [~, iter] = size(rl);
                 xr = num2str(rl(end));
                 time = num2str(time);
                 iter = num2str(iter);
                 status = 'Run successfully';
            end
        end
        writeToFile(filename , iter, xr, method, time, status, rl, frl, erl, override);
        override = 0;
        method = 'False-position';
        if (isnan(xl) || isnan(xu))
            iter = 'Undefined';
            status = 'Error ! Non-valid bounds';
            xr = 'Undefined';
            time = 'Undefined';
        else
            tic;
            [~, ~, rl, erl, frl, flag] = falsePosition(f, xl, xu, acc, maxIter);
            time = toc;
            if (flag)
                iter = 'Undefined';
                status = 'Error! F(Xu) * F(Xl) > 0';
                xr = 'Undefined';
                time = 'Undefined';
            else    
                [~, iter] = size(rl);
                 xr = num2str(rl(end));
                 time = num2str(time);
                 iter = num2str(iter);
                 status = 'Run successfully';
            end
        end
        writeToFile(filename , iter, xr, method, time, status, rl, frl, erl, override);
        method = 'Fixed point';
        if (isnan(x0))
            iter = 'Undefined';
            status = 'Error ! Non-valid initial point';
            xr = 'Undefined';
            time = 'Undefined';
        else
            g = @(x) f(x) + x;
            tic;
            [rl, erl, frl] = fixedPoint(f, g, x0, acc, maxIter);
            time = toc;
            [~, iter] = size(rl);
            xr = num2str(rl(end));
             time = num2str(time);
             iter = num2str(iter);
             status = 'Run successfully';
        end;
        writeToFile(filename , iter, xr, method, time, status, rl, frl, erl, override);
        method = 'Newton-Rhapson';
        if (isnan(x0))
            iter = 'Undefined';
            status = 'Error ! Non-valid initial point';
            xr = 'Undefined';
            time = 'Undefined';
        else
            syms x;
            df = inline(diff(sym(equ)), 'x');
            tic;
            [rl, erl, frl, ~, flag, message] = newtonRaphson(f,df,x0,acc, maxIter);
            time = toc;
            if (flag)
               iter = 'Undefined';
                status = message;
                xr = 'Undefined';
                time = 'Undefined';
            else
                [~, iter] = size(rl);
                xr = num2str(rl(end));
                 time = num2str(time);
                 iter = num2str(iter);
                 status = 'Run successfully';
            end
        end;
        writeToFile(filename , iter, xr, method, time, status, rl, frl, erl, override);
        method = 'Secant';
        if (isnan(x0) || isnan(x1) || x0 == x1)
            iter = 'Undefined';
            status = 'Error ! Non-valid bounds';
            xr = 'Undefined';
            time = 'Undefined';
        else
            tic;
            [~, rl, ~, frl, erl] = secant(f, x0, x1, acc, maxIter);
            time = toc;
            xr = num2str(rl(end));
            [~, iter] = size(rl);
             time = num2str(time);
             iter = num2str(iter);
             status = 'Run successfully';
        end;
    elseif (strcmp(selection,'General'))
    end
    writeToFile(filename , iter, xr, method, time, status, rl, frl, erl, override);

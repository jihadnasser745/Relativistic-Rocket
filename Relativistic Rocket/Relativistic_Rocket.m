function varargout = Relativistic_Rocket(varargin)
% RelativisticRocket MATLAB code for RelativisticRocket.fig
%      RelativisticRocket, by itself, creates a new RelativisticRocket or raises the existing
%      singleton*.
%
%      H = RelativisticRocket returns the handle to a new RelativisticRocket or the handle to
%      the existing singleton*.
%
%      RelativisticRocket('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RelativisticRocket.M with the given input arguments.
%
%      RelativisticRocket('Property','Value',...) creates a new RelativisticRocket or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RelativisticRocket_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RelativisticRocket_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RelativisticRocket

% Last Modified by GUIDE v2.5 04-Feb-2021 21:25:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RelativisticRocket_OpeningFcn, ...
                   'gui_OutputFcn',  @RelativisticRocket_OutputFcn, ...
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


% --- Executes just before RelativisticRocket is made visible.
function RelativisticRocket_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to fn
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RelativisticRocket (see VARARGIN)

% Choose default command line output for RelativisticRocket
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RelativisticRocket wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RelativisticRocket_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to fn
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in SimulateR.
function SimulateR_Callback(hObject, eventdata, handles)
% hObject    handle to SimulateR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s=get(handles.Acc,'String');
a=str2double(s);%conversion
s=get(handles.TR,'String');
tR=str2double(s);%conversion
c = 3e8;
save pp.mat a tR c



[yy,t]=wRK4(@fR,0,0,tR,100);

axes(handles.FR)%pour tracer cette fonction sur le premier axe
plot(t,yy,'g+',t,a.*t,'b');grid;
handles.myworld = vrworld('R3.wrl');
open(handles.myworld);
set(handles.myworld, 'Description', 'My first virtual world');
view(handles.myworld);
xR = c^2/a *(log(cosh(a.*t./c)));
for i = 1:(length(t))
handles.myworld.R2.translation = [0  xR(i)/1e11  0];
pause(0.1)
end
msgbox('Fin Simulation','OK');
% Update handles structure
% guidata(hObject, handles);

function dy=fR(t,~)
load pp
c = 3e8;
dy = a*(1-(tanh(a.*t./c)).^2);

function dy=fN(tN,~)
load pp
dy = Ve*FB./(M0 - FB.*tN);



function Ve_Callback(hObject, eventdata, handles)
% hObject    handle to Ve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ve as text
%        str2double(get(hObject,'String')) returns contents of Ve as a double


% --- Executes during object creation, after setting all properties.
function Ve_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FB_Callback(hObject, eventdata, handles)
% hObject    handle to FB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FB as text
%        str2double(get(hObject,'String')) returns contents of FB as a double


% --- Executes during object creation, after setting all properties.
function FB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function M0_Callback(hObject, eventdata, handles)
% hObject    handle to M0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of M0 as text
%        str2double(get(hObject,'String')) returns contents of M0 as a double


% --- Executes during object creation, after setting all properties.
function M0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to M0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Acc_Callback(hObject, eventdata, handles)
% hObject    handle to Acc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Acc as text
%        str2double(get(hObject,'String')) returns contents of Acc as a double


% --- Executes during object creation, after setting all properties.
function Acc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Acc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SimulateN.
function SimulateN_Callback(hObject, eventdata, handles)
% hObject    handle to SimulateN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s=get(handles.Ve,'String');
Ve=str2double(s);%conversion
s=get(handles.M0,'String');
M0=str2double(s);%conversion
s=get(handles.FB,'String');
FB=str2double(s);%conversion

save pp.mat Ve M0 FB

tf = M0/FB - 1;
[y,tN]=wRK4(@fN,4.2857,1,tf,100);
axes(handles.FN)%pour tracer cette fonction sur le premier axe
plot(tN,y,'r*');grid;
handles.myworld = vrworld('R2.wrl');
open(handles.myworld);
set(handles.myworld, 'Description', 'My first virtual world');
view(handles.myworld);
xN = (Ve/FB).*(M0.*log(abs(FB.*tN - M0)) + FB.*tN.*log(M0./(M0-FB.*tN)) + FB.*tN);
x1 = xN(1);
for i = 1:(length(tN))
handles.myworld.R1.translation = [0  (xN(i)-x1)/1e4  0];
pause(0.1)
end
msgbox('Fin Simulation','OK');



function TR_Callback(hObject, eventdata, handles)
% hObject    handle to TR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TR as text
%        str2double(get(hObject,'String')) returns contents of TR as a double


% --- Executes during object creation, after setting all properties.
function TR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

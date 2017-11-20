function varargout = SubremovalApp(varargin)
% SUBREMOVALAPP MATLAB code for SubremovalApp.fig
%      SUBREMOVALAPP, by itself, creates a new SUBREMOVALAPP or raises the existing
%      singleton*.
%
%      H = SUBREMOVALAPP returns the handle to a new SUBREMOVALAPP or the handle to
%      the existing singleton*.
%
%      SUBREMOVALAPP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUBREMOVALAPP.M with the given input arguments.
%
%      SUBREMOVALAPP('Property','Value',...) creates a new SUBREMOVALAPP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SubremovalApp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SubremovalApp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SubremovalApp

% Last Modified by GUIDE v2.5 13-Nov-2017 22:45:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SubremovalApp_OpeningFcn, ...
                   'gui_OutputFcn',  @SubremovalApp_OutputFcn, ...
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


% --- Executes just before SubremovalApp is made visible.
function SubremovalApp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SubremovalApp (see VARARGIN)

% Choose default command line output for SubremovalApp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SubremovalApp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SubremovalApp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function startFrame_Callback(hObject, eventdata, handles)
% hObject    handle to startFrame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startFrame as text
%        str2double(get(hObject,'String')) returns contents of startFrame as a double
a=str2double(get(hObject,'String')); %convert string value in double and store in a
assignin('base', 'strtf', a); %store current value of a in workspace

% --- Executes during object creation, after setting all properties.
function startFrame_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startFrame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function endFrame_Callback(hObject, eventdata, handles)
% hObject    handle to endFrame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of endFrame as text
%        str2double(get(hObject,'String')) returns contents of endFrame as a double
b=str2double(get(hObject,'String')); %convert string value in double and store in a
assignin('base', 'endf', b); %store current value of a in workspace

% --- Executes during object creation, after setting all properties.
function endFrame_CreateFcn(hObject, eventdata, handles)
% hObject    handle to endFrame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start_show.
function start_show_Callback(hObject, eventdata, handles)
% hObject    handle to start_show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vid = evalin('base','vid');
strtf = evalin('base','strtf');
endf = evalin('base','endf');
subremoval(vid,strtf,endf);


% --- Executes on button press in upload_vid.
function upload_vid_Callback(hObject, eventdata, handles)
% hObject    handle to upload_vid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,p] = uigetfile({'*.mp4;*.3gp;*.wmv;*.flv;*.avi','Supported videos';...
                 '*.mp4','MP4 (*.mp4)';...
                 '*.3gp','3GP (*.3gp)';...
                 '*.wmv','WMV (*.wmv)';...
                 '*.flv','FLV (*.flv,)';...
                 '*.avi','AVI (*.avi,)';...
                 '*.*','All files (*.*)'});
x = VideoReader([p f]);
%assignin('base','vidTitle',f);
assignin('base', 'vid', x);
assignin('base', 'Pic', x);
textLabel = sprintf('The video %s is uploaded',f);
set(handles.text6, 'String', textLabel);



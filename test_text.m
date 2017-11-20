%%%%%%%%%%%%%%%GUI%%%%%%%%%%%%

function varargout = test_text(varargin)
% TEST_TEXT MATLAB code for test_text.fig
%      TEST_TEXT, by itself, creates a new TEST_TEXT or raises the existing
%      singleton*.
%
%      H = TEST_TEXT returns the handle to a new TEST_TEXT or the handle to
%      the existing singleton*.
%
%      TEST_TEXT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST_TEXT.M with the given input arguments.
%
%      TEST_TEXT('Property','Value',...) creates a new TEST_TEXT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_text_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_text_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test_text

% Last Modified by GUIDE v2.5 06-Aug-2017 22:14:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_text_OpeningFcn, ...
                   'gui_OutputFcn',  @test_text_OutputFcn, ...
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


% --- Executes just before test_text is made visible.
function test_text_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test_text (see VARARGIN)

% Choose default command line output for test_text
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test_text wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_text_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in upload_image.
function upload_image_Callback(hObject, eventdata, handles)
% hObject    handle to upload_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,p] = uigetfile({'*.png;*.jpg;*.bmp;*.tif','Supported images';...
                 '*.png','Portable Network Graphics (*.png)';...
                 '*.jpg','J-PEG (*.jpg)';...
                 '*.bmp','Bitmap (*.bmp)';...
                 '*.tif','Tagged Image File (*.tif,)';...
                 '*.*','All files (*.*)'});
x = imread([p f]);
himage=imshow(x);
title(f)
assignin('base', 'Img', x);
assignin('base', 'Pic', x);
% --- Executes on button press in gamma_correction.
function gamma_correction_Callback(hObject, eventdata, handles)
% hObject    handle to gamma_correction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Make a grayscale copy of our input image
img1=evalin('base','Img');
img2=rgb2gray(img1);
I = double(img2);
%Determine input image dimensions
[j k] = size(I);
%Determine the extreme intensity values for our input image
in_min = double(min(min(I)));
in_max = double(max(max(I)));
%Determine the extreme intensity values for the output image
out_min = double(1);
out_max = double(1);
%Determine the amount to "shift/move" pixel intensity values by
shift_val = in_min - out_min;
%Determine the value to "scale" pixel intensity values by
scale_val = (out_max)/(in_max-in_min);
%Perform the shift and scale (in that order)
for counter1 = 1:j
 for counter2 = 1:k
 I(counter1,counter2)=(I(counter1,counter2)-double(shift_val))*double(scale_val);
 end
end
%Perform the gamma correction operation
gamma_value=evalin('base','value');
for counter1 = 1:j
 for counter2 = 1:k
 I(counter1,counter2)=(I(counter1,counter2)).^gamma_value;
 end
end
output_image = I;
imshow(I);
% I = cat(3, I,I,I);
% 
% assignin('base', 'Img', I);


% --- Executes on button press in adaptive_thresholding.
function adaptive_thresholding_Callback(hObject, eventdata, handles)
% hObject    handle to adaptive_thresholding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=evalin('base','Img'); %call Img from workspace to reuse it as Img1
img2=rgb2gray(img1); %convert Img1 in gray as Img2
sens=evalin('base','sensitivity'); %call sensityvity value from workspace & use as sens
T = adaptthresh(img2, sens); %adaptive thresholding change value
%T = adaptthresh(img2,sens,'ForegroundPolarity','dark'); 
%for dark pages,uncomment the above line
BW = imbinarize(img2,T);
imshow(BW);
J=uint8(BW); %convert binary to gray
J = cat(3,J,J,J); %convert 2D gray to 3D image
assignin('base', 'Img', J); %store current value of Img to workspace

% --- Executes on button press in histogram_modification.
function histogram_modification_Callback(hObject, eventdata, handles)
% hObject    handle to histogram_modification (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=evalin('base','Img'); %call Img from workspace to do histogram modification on it.
[J T] = histeq(rgb2gray(img1)); %histogram modification on img1
imshow(J); %show J value, i.e histogram modified value
J = cat(3,J,J,J); %convert 2D gray to 3D image
assignin('base', 'Img', J); %store current value of Img in workspace to reuse it
function gamma_value_Callback(hObject, eventdata, handles) 
% hObject    handle to gamma_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamma_value as text
%        str2double(get(hObject,'String')) returns contents of gamma_value as a double
a=str2double(get(hObject,'String')); %convert string value in double and store in a
assignin('base', 'value', a); %store current value of a in workspace 


% --- Executes during object creation, after setting all properties.
function gamma_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function sensitivity_Callback(hObject, eventdata, handles)
% hObject    handle to sensitivity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sensitivity as text
%        str2double(get(hObject,'String')) returns contents of sensitivity as a double
b= str2double(get(hObject,'String'));
assignin('base', 'sensitivity', b);

% --- Executes during object creation, after setting all properties.
function sensitivity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sensitivity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gamma_correction_modified.
function gamma_correction_modified_Callback(hObject, eventdata, handles)
% hObject    handle to gamma_correction_modified (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=evalin('base','Img');
img2=rgb2gray(img1);
a=evalin('base','value'); %call gamma value from the another side box
J = imadjust(img2,[],[],a); %gamma correction
imshow(J);
J = cat(3,J,J,J); %convert 2D gray to 3D image
assignin('base', 'Img', J); %store gamma image in the variable Img to workspace to reuse it


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A= evalin('base','Pic'); % call Img from workspace to use it
imshow(A);
assignin('base','Img',A);%store new value of Img in workspace
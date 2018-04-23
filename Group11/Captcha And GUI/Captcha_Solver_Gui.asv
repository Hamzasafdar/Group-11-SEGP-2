function varargout = Captcha_Solver_Gui(varargin)
% CAPTCHA_SOLVER_GUI MATLAB code for Captcha_Solver_Gui.fig
%      CAPTCHA_SOLVER_GUI, by itself, creates a new CAPTCHA_SOLVER_GUI or raises the existing
%      singleton*.
%
%      H = CAPTCHA_SOLVER_GUI returns the handle to a new CAPTCHA_SOLVER_GUI or the handle to
%      the existing singleton*.
%
%      CAPTCHA_SOLVER_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAPTCHA_SOLVER_GUI.M with the given input arguments.
%
%      CAPTCHA_SOLVER_GUI('Property','Value',...) creates a new CAPTCHA_SOLVER_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Captcha_Solver_Gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Captcha_Solver_Gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Captcha_Solver_Gui

% Last Modified by GUIDE v2.5 23-Apr-2018 22:27:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Captcha_Solver_Gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Captcha_Solver_Gui_OutputFcn, ...
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


% --- Executes just before Captcha_Solver_Gui is made visible.
function Captcha_Solver_Gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Captcha_Solver_Gui (see VARARGIN)

% Choose default command line output for Captcha_Solver_Gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% Set Background Image
% axes
axis=axes('unit','normalized','position',[0 0 1 1]);
% import Back Ground Image
background=imread('BackGround.jpg');
imagesc(background);
set(axis,'handlevisibility','off','visible','off')

% UIWAIT makes Captcha_Solver_Gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Captcha_Solver_Gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Browse_Image.
function Browse_Image_Callback(hObject, eventdata, handles)
global len
global Image
global crop
global Ibox3
global Ibw
global input
% hObject    handle to Browse_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Image_Name Path_Name]=uigetfile({'*.jpeg';'*.jpg';'*.bmp';'*.tiff';'*.png'});
Image=strcat(Path_Name,Image_Name);
axes(handles.browseImage)
imshow(Image);
handles.Image=Image;
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bounding Box Image
% I=imread('c.jpeg');
I=imread(Image);
[input,len,crop,Ibox3,Ibw]=captcha_file_reader(I);
disp(input);
handles.Image=Image;
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on button press in preProcessing.
function preProcessing_Callback(hObject, eventdata, handles)
global len
global crop
global Image
global Ibox3
global Ibw
% hObject    handle to preProcessing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gph=imread('graph.png');
axes(handles.graph)
imshow(gph);
handles.gph=gph;
guidata(hObject,handles);




set(handles.edit2,'String',len);


axes(handles.gray)
imshow(Ibw);
handles.Ibw=Ibw;
guidata(hObject,handles);



% % % % % bounding box
axes(handles.axes8)
% ITextRegion = insertShape(Image, 'Rectangle', Ibox3,'LineWidth',3);
imshow(Image);
handles.Image=Image;
guidata(hObject,handles);
pause(2);
% disp(Ibox3(1,1))
for i=1 : len
rectangle('position',[Ibox3(i,1),Ibox3(i,2),Ibox3(i,3),Ibox3(i,4)],'edgecolor','r');
% pause(1);

end
% % % % % % % % % % % % % % % 

% % % % %  char show
for i=1: len
axes(handles.axes7)
imshow(crop{i});
handles.Image=crop{i};
guidata(hObject,handles);
% pause(1);
% % % % % % % % 
end
a=imread('network.png');
axes(handles.axes11)
imshow(a);
handles.a=a;
guidata(hObject,handles);

% % % % % % % % % % % % % % % % % testing area
captcha= ones(len,15); 
for i=1 :len
    [width , height , blackPixels,s_length,feature,startingXav,startingYav,endingXav,endingYav,thetaav,rhoav] = captcha_char_feature_extractor(crop{i});
    captcha(i,1) = width;
   captcha(i,2) = height;
   captcha(i,3) = blackPixels;
   captcha(i,4) = Ibox3(i,1);
   captcha(i,5) = Ibox3(i,2);
   captcha(i,6) = Ibox3(i,3);
   captcha(i,7) = Ibox3(i,4);
   captcha(i,8) = s_length;
   captcha(i,9) = feature;
   captcha(i,10) = startingXav;
   captcha(i,11) = startingYav;
   captcha(i,12) = endingXav;
   captcha(i,13) = endingYav;
   captcha(i,14) = thetaav;
   captcha(i,15) = rhoav;
    
 end
save('cptch.mat','captcha');

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% % % % % % % % % % % % % % % % % % % % % % % % % % % % pass to neural network
load('net.mat');
char_array= ones(1,len);
for j=1:len
   out{j}=round(net(captcha(j,:)')); 
     var=match(out{j});
     char_array(1,j)=var;

end
% disp(out{1});
% disp(round(net(captcha(1,:)')));
% disp(out{1});
% disp(char_array(1,1));

final=ocr(imread('c.jpeg'));
% % disp(final.Text);
f=final.Text;
set(handles.edit3,'String',f);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 







function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

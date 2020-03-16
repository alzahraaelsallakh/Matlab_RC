function varargout = manualControl(varargin)
% MANUALCONTROL MATLAB code for manualControl.fig
%      MANUALCONTROL, by itself, creates a new MANUALCONTROL or raises the existing
%      singleton*.
%
%      H = MANUALCONTROL returns the handle to a new MANUALCONTROL or the handle to
%      the existing singleton*.
%
%      MANUALCONTROL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANUALCONTROL.M with the given input arguments.
%
%      MANUALCONTROL('Property','Value',...) creates a new MANUALCONTROL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before manualControl_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to manualControl_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help manualControl

% Last Modified by GUIDE v2.5 02-Feb-2020 14:23:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @manualControl_OpeningFcn, ...
                   'gui_OutputFcn',  @manualControl_OutputFcn, ...
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


% --- Executes just before manualControl is made visible.
function manualControl_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to manualControl (see VARARGIN)

% Choose default command line output for manualControl
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes manualControl wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Initalizing Direction %
set_param(['controllingRC/dir'],'Value','0');



% --- Outputs from this function are returned to the command line.
function varargout = manualControl_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in forwardButton.
function forwardButton_Callback(hObject, eventdata, handles)
% hObject    handle to forwardButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Moving Backward %
set_param(['controllingRC/dir'],'Value','1');


% --- Executes on button press in backwardButton.
function backwardButton_Callback(hObject, eventdata, handles)
% hObject    handle to backwardButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Moving Backward %
set_param(['controllingRC/dir'],'Value','2');


% --- Executes on button press in rightButton.
function rightButton_Callback(hObject, eventdata, handles)
% hObject    handle to rightButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Moving Right %
set_param(['controllingRC/dir'],'Value','3');


% --- Executes on button press in leftButton.
function leftButton_Callback(hObject, eventdata, handles)
% hObject    handle to leftButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Moving left %
set_param(['controllingRC/dir'],'Value','4');



% --- Executes on button press in stopButton.
function stopButton_Callback(hObject, eventdata, handles)
% hObject    handle to stopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Stopping The car %
set_param(['controllingRC/dir'],'Value','0');



% --- Executes on button press in backToMenuButton.
function backToMenuButton_Callback(hObject, eventdata, handles)
% hObject    handle to backToMenuButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Stopping the car %
set_param(['controllingRC/dir'],'Value','0');
    
% Switching GUI's %
set_param(['controllingRC/mode'],'Value', '0');
closedObj=findobj('Name','manualControl');
close(closedObj)
run('chooseMode')

% --- Executes on button press in exitButton.
function exitButton_Callback(hObject, eventdata, handles)
% hObject    handle to exitButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Stopping The car %
set_param(['controllingRC/dir'],'Value','0');
% Closing GUI %
set_param(['controllingRC/mode'],'Value', '3');
set_param('controllingRC','SimulationCommand','stop');
closedObj=findobj('Name','manualControl');
close(closedObj)

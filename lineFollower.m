function varargout = lineFollower(varargin)
% LINEFOLLOWER MATLAB code for lineFollower.fig
%      LINEFOLLOWER, by itself, creates a new LINEFOLLOWER or raises the existing
%      singleton*.
%
%      H = LINEFOLLOWER returns the handle to a new LINEFOLLOWER or the handle to
%      the existing singleton*.
%
%      LINEFOLLOWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LINEFOLLOWER.M with the given input arguments.
%
%      LINEFOLLOWER('Property','Value',...) creates a new LINEFOLLOWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lineFollower_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lineFollower_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lineFollower

% Last Modified by GUIDE v2.5 02-Feb-2020 13:40:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lineFollower_OpeningFcn, ...
                   'gui_OutputFcn',  @lineFollower_OutputFcn, ...
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


% --- Executes just before lineFollower is made visible.
function lineFollower_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lineFollower (see VARARGIN)

% Choose default command line output for lineFollower
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lineFollower wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set_param(['controllingRC/dir'],'Value','1');


% --- Outputs from this function are returned to the command line.
function varargout = lineFollower_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in backToMenuButton.
function backToMenuButton_Callback(hObject, eventdata, handles)
% hObject    handle to backToMenuButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Switching GUIs%
set_param(['controllingRC/mode'],'Value', '0');
closedObj=findobj('Name','lineFollower');
close(closedObj)
run('chooseMode')


% --- Executes on button press in exitButton.
function exitButton_Callback(hObject, eventdata, handles)
% hObject    handle to exitButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



%Closing GUI%
set_param(['controllingRC/mode'],'Value', '0');
set_param(['controllingRC/mode'],'Value', '3');
set_param('controllingRC','SimulationCommand','stop');
closedObj=findobj('Name','lineFollower');
close(closedObj)


% --- Executes on button press in stopButton.
function stopButton_Callback(hObject, eventdata, handles)
% hObject    handle to stopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Stopping the car%
set_param(['controllingRC/dir'],'Value','0');

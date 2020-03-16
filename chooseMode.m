function varargout = chooseMode(varargin)
% CHOOSEMODE MATLAB code for chooseMode.fig
%      CHOOSEMODE, by itself, creates a new CHOOSEMODE or raises the existing
%      singleton*.
%
%      H = CHOOSEMODE returns the handle to a new CHOOSEMODE or the handle to
%      the existing singleton*.
%
%      CHOOSEMODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHOOSEMODE.M with the given input arguments.
%
%      CHOOSEMODE('Property','Value',...) creates a new CHOOSEMODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chooseMode_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chooseMode_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chooseMode

% Last Modified by GUIDE v2.5 02-Feb-2020 13:54:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chooseMode_OpeningFcn, ...
                   'gui_OutputFcn',  @chooseMode_OutputFcn, ...
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


% --- Executes just before chooseMode is made visible.
function chooseMode_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chooseMode (see VARARGIN)


% Choose default command line output for chooseMode
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chooseMode wait for user response (see UIRESUME)
% uiwait(handles.figure1);

if isempty(find_system('Name','controllingRC')),
open_system('controllingRC');
set_param('controllingRC','SimulationMode','external');
end
if strcmp(get_param('controllingRC', 'SimulationStatus'),'stopped')
    set_param('controllingRC','SimulationCommand','start');
end

% Initalizing mode to main menu %
set_param(['controllingRC/mode'],'Value', '0');



% --- Outputs from this function are returned to the command line.
function varargout = chooseMode_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in manualControlButton.
function manualControlButton_Callback(hObject, eventdata, handles)
% hObject    handle to manualControlButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if isempty(find_system('Name','controllingRC')),
open_system('controllingRC');
set_param('controllingRC','SimulationMode','external');
end
if strcmp(get_param('controllingRC', 'SimulationStatus'),'stopped')
    set_param('controllingRC','SimulationCommand','start');
end

% Switching to manual control mode %
set_param(['controllingRC/mode'],'Value', '2');

% Closing choose mode Window and switching to manual control window %  
closedObj=findobj('Name','chooseMode');
close(closedObj);
run('manualControl')


% --- Executes on button press in lineFollowerButton.
function lineFollowerButton_Callback(hObject, eventdata, handles)
% hObject    handle to lineFollowerButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isempty(find_system('Name','controllingRC')),
open_system('controllingRC');
set_param('controllingRC','SimulationMode','external');
end
if strcmp(get_param('controllingRC', 'SimulationStatus'),'stopped')
    set_param('controllingRC','SimulationCommand','start');
end


% Switching to line follower mode %
set_param(['controllingRC/mode'],'Value', '1');
set_param(['controllingRC/dir'],'Value','1');

% Closing choose mode Window and switching to line follower window %  
closedObj=findobj('Name','chooseMode');
close(closedObj);
run('lineFollower')

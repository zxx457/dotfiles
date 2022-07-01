
;SendMode(Input); Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_InitialWorkingDir  ; Ensures a consistent starting directory.


;init
SetCapsLockState "AlwaysOff"
ProcessSetPriority "High"

if not "A_IsAdmin"
{
	Run '*RunAs "' A_ScriptFullPath '"'
}

;key mapping
^!CapsLock::CapsLock

;navi
CapsLock & h::LEFT
CapsLock & j::DOWN
CapsLock & k::UP
CapsLock & l::RIGHT
CapsLock & n::Home
CapsLock & m::End

;media
CapsLock & Space::RAlt
RAlt & a::Media_Play_Pause
RAlt & s::Media_Prev
RAlt & d::Media_Next
RAlt & q::Volume_Down
RAlt & w::Volume_Up
RAlt & e::Volume_Mute

; RCtrl & Up::Volume_Up
; RCtrl & Down::Volume_Down

;f
CapsLock & 1::F1
CapsLock & 2::F2
CapsLock & 3::F3
CapsLock & 4::F4
CapsLock & 5::F5
CapsLock & u::PgUp
CapsLock & i::PgDn


;useful
; `::Esc
; CapsLock & `::`
; Shift & `::~
CapsLock & BackSpace::Delete

CapsLock & Esc::`
Shift & Esc::~

Alt & BackSpace::Delete


;the win key modify
~LWin::Send ("{Blind}{vk07}")
#f::Send ("{Blind}{vk07}")
#g::Send ("{Blind}{vk07}")
#h::Send ("{Blind}{vk07}")
#k::Send ("{Blind}{vk07}")
#v::Send ("{Blind}{vk07}")

#s::#s





; Windows + Q close active window
#q::
{
	if !WinActive("ahk_class WorkerW")
	{
		WinClose "A"
	}
return
}

; Windows + X minimize active window
#x::
{
	if !WinActive("ahk_class WorkerW")
	{
		WinMinimize "A"
	}	
return
}


; Alt + Enter changes Window between maximized and minimized
!Enter::
{
	maximized := WinGetMinMax("A")
	if (maximized)
		WinRestore "A"
	else
		WinMaximize "A"
	return
}


;array stores program execution path
exe_map_its_index := Map()
exe_array_path := Array()
exe_array_name := Array()



;1
push_value("","ahk_exe WindowsTerminal.exe","terminal")
^Space::
{
	index := exe_map_its_index["terminal"]
	control_window_specific(exe_array_path[index],exe_array_name[index])
	return 
} 


;2
push_value("C:\Users\zeng\scoop\apps\OneCommander3.5.9.0\OneCommander.exe","ahk_exe OneCommander.exe","OneCommander")
CapsLock & d::
{
	index := exe_map_its_index["OneCommander"]
	control_window_specific(exe_array_path[index],exe_array_name[index])
	return
}

;3
push_value("","ahk_exe msedge.exe","edge")
CapsLock & e::
{
	index := exe_map_its_index["edge"]
	control_window_specific(exe_array_path[index],exe_array_name[index])
	return
}

;4
push_value("C:\Users\zeng\AppData\Local\Programs\Microsoft VS Code\Code.exe","ahk_exe code.exe","code")
CapsLock & c::
{
	index := exe_map_its_index["code"]
	control_window_specific(exe_array_path[index],exe_array_name[index])
	return
}

;5
push_value("","ahk_exe Logseq.exe","logseq")
CapsLock & q::
{
	index := exe_map_its_index["logseq"]
	control_window_specific(exe_array_path[index],exe_array_name[index])
	return
}


control_window_specific(exe_path,exe_name)
{
	isExist := WinExist(exe_name)
	if (isExist)
	{
		if (WinActive(exe_name))
			WinMinimize(exe_name)
		else
			WinActivate(exe_name)
	}
	else
	{
		if(exe_path)
			Run(exe_path)
	}

	return
}

push_value(exe_path,exe_name,exe_tag)
{
	static value := 1
	exe_array_path.Push(exe_path)
	exe_array_name.Push(exe_name)
	exe_map_its_index[exe_tag] := value

	value := value + 1
}


;默认输出音频设备切换, 使用nircmd
device_array := ["Monitor Out","USB Out", "Headphone Out"]
alter_default_sound_device(device_name)
{
	cmd := "nircmdc.exe setdefaultsounddevice" " " "`"" device_name "`""
	Run(cmd , , "Hide")
}

RAlt & r::
{
	static num := 1
	alter_default_sound_device(device_array[num])

	if(num == device_array.Length)
	{
		num := 1
	}
	else
	{
		num := num + 1
	}

	return
}


;在substance 3d designer中 ctrl & d删除节点
#hotif WinActive("ahk_class Qt5158QWindowIcon")
Ctrl & d::BackSpace


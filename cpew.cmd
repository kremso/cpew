@echo off
rem 
rem Create new eclipse workspace and copy the settings from the old workspace
rem 
rem     http://www.kinoshita.eti.br/cpew
rem
rem author - Bruno P. Kinoshita - brunodepaulak yhoo combr - 2010.
rem original version author - Tomas Kramar, kramar.tomas@gmail.com, 2008
rem Licensed under WTFPL - Do What The Fuck You Want To Public License. 

if ""%1"" == """" goto missingInputWorkspace
if ""%2"" == """" goto missingOutputWorkspace

goto okParams

:missingInputWorkspace
echo Sorry, did you forget to provide me the input workspace location?
goto usage

:missingOutputWorkspace
echo Sorry, did you forget to provide me the output workspace location?
goto usage

:usage
echo cpew usage: cpew old_workspace new_workspace
goto end

:okParams
mkdir "%2"
mkdir "%2\.metadata\.plugins\org.eclipse.core.runtime\.settings"
copy "%1\.metadata\.plugins\org.eclipse.core.runtime\.settings\" "%2\.metadata\.plugins\org.eclipse.core.runtime\.settings\"
echo New workspace created. Now start your Eclipse and point it to the %2 workspace

:end

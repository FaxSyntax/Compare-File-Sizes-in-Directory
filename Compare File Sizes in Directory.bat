@echo off
setlocal enabledelayedexpansion

set "folder1=Y:\Videos\Films\Anime"
set "folder2=O:\Videos\Films\Anime"
set "outputFile=output.txt"

echo Comparing files in %folder1% and %folder2% > "%outputFile%"
echo. >> "%outputFile%"

for %%F in ("%folder1%\*") do (
    set "file1=%%~nxF"
    set "size1=%%~zF"
    if exist "%folder2%\!file1!" (
        set "size2=!size1!"
        for %%G in ("%folder2%\!file1!") do set "size2=%%~zG"
        if not "!size1!"=="!size2!" (
            echo !file1! differs in size: !size1! bytes in %folder1%, %%~zG bytes in %folder2% >> "%outputFile%"
        )
    ) else (
REM        echo !file1! not found in %folder2% >> "%outputFile%"
    )
)

REM	for %%F in ("%folder2%\*") do (
REM	    set "file2=%%~nxF"
REM	    if not exist "%folder1%\!file2!" (
REM	        echo !file2! not found in %folder1% >> "%outputFile%"
REM	    )
REM	)

echo Comparison complete. Results saved to %outputFile%.
endlocal

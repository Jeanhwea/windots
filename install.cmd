@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set WINDOTS=%HOME%\windots
IF NOT EXIST "%WINDOTS%" (
    call git clone -b 3.0 git@github.com:Jeanhwea/windots.git "%WINDOTS%"
) ELSE (
    @set ORIGINAL_DIR=%CD%
    echo updating windots files ...
    chdir /d "%WINDOTS%"
    call git pull
    chdir /d "%ORIGINAL_DIR%"
    call cd "%WINDOTS%"
)

call mklink "%HOME%\.vimrc" "%WINDOTS%\vimrc"
call mklink "%HOME%\_vimrc" "%WINDOTS%\vimrc"
call mklink "%HOME%\.vimrc.bundles" "%WINDOTS%\vimrc.bundles"
call mklink /J "%HOME%\.vim" "%WINDOTS%\vim"
call mklink /J "%HOME%\.emacs.d" "%WINDOTS%\emacs"

IF NOT EXIST "%WINDOTS%\.vim\bundle" (
    call mkdir "%WINDOTS%\.vim\bundle"
)

IF NOT EXIST "%HOME%/.vim/bundle/vundle" (
    call git https://github.com/VundleVim/Vundle.vim.git "%HOME%/.vim/bundle/vundle"
) ELSE (
  call cd "%HOME%/.vim/bundle/vundle"
  call git pull
  call cd %HOME%
)


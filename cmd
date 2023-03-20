#! /bin/sh
basedir= $( dirname " $( echo " $0 "  | sed -e ' s,\\,/,g ' ) " )

caso  ` uname `  em
    * CYGWIN * | * MINW * | * MSYS * ) basedir= ` cygpath -w " $ basedir " ` ;;
esac

if [ -x  " $basedir /node " ] ;  então
  " $basedir /node "   " $basedir /../mime/cli.js "  " $@ "
  ret = $?
outro 
  node   " $basedir /../mime/cli.js "  " $@ "
  ret = $?
fi
sair  $ret
@ ECO  desligado
SETLOCAL
CHAMADA : find_dp0

SE  EXISTIR  " %dp0% \node.exe " (
  SET  " _prog = %dp0% \node.exe "
) OUTRO (
  SET  " _prog = nó "
  SET  PATHEXT = %PATHEXT: ;.JS; = ; %
)

" %_prog% "   " %dp0% \..\mime\cli.js "  %*
ENDLOCAL
SAIR /b %errorlevel%
: find_dp0
SET  dp0 = %~dp0
SAIR /b
# !/usr/bin/env pwsh
$basedir = Split-Path  $MyInvocation .MyCommand.Definition  - Pai

$exe = " "
if ( $PSVersionTable .PSVersion  -lt  " 6.0 "  -ou  $IsWindows ) {
  # Corrige o caso quando as compilações Windows e Linux do Node
  # são instalados no mesmo diretório
  $exe = " .exe "
}
$ret = 0
if ( Test-Path  " $basedir /node $exe " ) {
  &  " $basedir /node $exe "   " $basedir /../mime/cli.js "  $args
  $ret = $LASTEXITCODE
} senão {
  &  " node $exe "   " $basedir /../mime/cli.js "  $args
  $ret = $LASTEXITCODE
}
sair  $ret
#! /bin/sh
basedir= $( dirname " $( echo " $0 "  | sed -e ' s,\\,/,g ' ) " )

caso  ` uname `  em
    * CYGWIN * | * MINW * | * MSYS * ) basedir= ` cygpath -w " $ basedir " ` ;;
esac

if [ -x  " $basedir /node " ] ;  então
  " $basedir /node "   " $basedir /../nodemon/bin/nodemon.js "  " $@ "
  ret = $?
outro 
  node   " $basedir /../nodemon/bin/nodemon.js "  " $@ "
  ret = $?
fi
sair  $ret

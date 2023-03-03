@echo OFF
title mosi-sol checksum
color 0A
echo "----------checksum----------"

for /r %%f in (*) do (certutil -hashfile "%%f" MD5 | find /v "hash") >> output.dat

echo validate your download by checksum.md , check in output.dat 
pause 
exit /b
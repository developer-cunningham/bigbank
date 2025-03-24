@echo off
echo Cleaning old build files...
if exist dist rmdir /s /q dist
if exist build rmdir /s /q build
for /d %%i in (*.egg-info) do rmdir /s /q "%%i"

echo Adding new changes to Git...
git add .
git commit -m "Updated BigBank package"
git push origin main

echo Building new package...
python setup.py sdist bdist_wheel

echo Uploading to PyPI...
twine upload dist/*

echo Done!
pause